@echo off
setlocal enabledelayedexpansion

:: 【核心配置】锁定 D 盘环境路径
set "PROJECT_DIR=D:\dev\Whisper"
set "ACTIVATE_SCRIPT=%PROJECT_DIR%\.venv\Scripts\activate.bat"
:: 定义你希望存放所有模型的文件夹路径
set "MODEL_PATH=%PROJECT_DIR%\models"
:: 【双保险设置】
:: 1. 设置环境变量：这会告诉 Whisper (以及底层下载库) 缓存的“根目录”在 D 盘
:: 这样以后下载任何新模型，都会自动去 D:\dev\Whisper\models\whisper 文件夹下
set "XDG_CACHE_HOME=%MODEL_PATH%"

:MAIN_LOOP
cls
echo ======================================
echo    Whisper 自动转录 (锁定 D 盘环境)
echo ======================================
echo.

:: 1. 检查激活脚本是否存在，不存在则视为环境损坏，直接退出
if not exist "%ACTIVATE_SCRIPT%" (
    echo [错误] 无法找到环境激活脚本:
    echo "%ACTIVATE_SCRIPT%"
    echo 请检查 D 盘项目路径是否正确或 .venv 是否已删除。
    pause
    exit /b 1
)

:: 重置参数
set "model=turbo"
set "task=transcribe"
set "filepath="
set "choice="

:: 拖拽或输入
if "%~1"=="" (
    echo 请拖入文件，或输入路径：
    set /p "filepath=> "
) else (
    set "filepath=%~1"
)

if "!filepath!"=="" goto MAIN_LOOP

:: 路径处理
set "filepath=!filepath:"=!"
set "target_file="!filepath!""

if not exist !target_file! (
    echo 错误: 文件不存在
    timeout /t 3 >nul
    goto MAIN_LOOP
)

for %%F in (!target_file!) do (
    set "filedir=%%~dpF"
    set "filename=%%~nF"
)
if "!filedir:~-1!"=="\" set "filedir=!filedir:~0,-1!"

echo.
echo 选择模型 [1.tiny 2.base 3.small 4.medium 5.large 6.turbo(默认)]
set /p "choice=输入数字: "
if "!choice!"=="1" set "model=tiny"
if "!choice!"=="2" set "model=base"
if "!choice!"=="3" set "model=small"
if "!choice!"=="4" set "model=medium"
if "!choice!"=="5" set "model=large"
if "!choice!"=="6" set "model=turbo"

echo.
echo ===========================================
echo 正在远程激活环境: !PROJECT_DIR!
echo ===========================================

:: 【核心逻辑】远程激活环境
:: call 确保激活后的环境变量注入到当前 bat 进程中
call "%ACTIVATE_SCRIPT%"

:: 检查激活后 whisper 是否可用
where whisper >nul 2>nul
if errorlevel 1 (
    echo [错误] 环境激活成功但找不到 whisper 命令。
    pause
    exit /b 1
)

echo 状态: 环境已就绪，正在启动转录...
echo.

:: 执行转录（因为已经激活，直接用 python -m whisper 最稳）
python -m whisper !target_file! --model !model! --task !task! --output_dir "!filedir!"  --model_dir "%MODEL_PATH%"

if errorlevel 1 (
    echo.
    echo 处理失败，请检查显存是否充足或文件是否损坏。
    pause
    goto MAIN_LOOP
)

echo.
echo 转录成功！结果已保存至: "!filedir!"
pause
goto MAIN_LOOP