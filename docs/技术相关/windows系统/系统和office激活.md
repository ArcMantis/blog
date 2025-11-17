---
sidebar_position: 3
---

# 系统和office激活

## 系统数字激活

管理员打开powershell  
```
irm https://get.activated.win | iex
```


## office 套件的安装和激活

此方法可以自行选择安装需要的组件，office我这里分为了零售版和LTSC专业版，无论哪个版本都需要进行前置准备。但是激活方法不同，零售版需要购买密钥，LTSC可以自己激活。  
**前置准备**：获取office 软件部署工具：https://www.microsoft.com/en-us/download/details.aspx?id=49117  
安装(其实就是解压)后会得到setup.exe和一个configuration-Office365-x64.xml，前者是执行文件，后者是配置文件模板，这个用不到。    

###  零售版
 1. MSoffice2021官方ISO下载链接：**http://officecdn.microsoft.com/pr/492350f6-3a01-4f97-b9c0-c7c6ddf67d60/media/en-us/ProPlus2021Retail.img**  

 2. 完成步骤1下载后会得到一个.img镜像，右键单击然后选择挂载。完成后进入我的电脑，查看挂载到了哪个盘符。假设我这里挂在后到了F盘，记住他。  

 3. 新建一个文本文档，重命名为config.xml，写入下面的内容并保存。  
 ``` xml
<Configuration>
  <!-- 【最重要的一行】SourcePath 指向你挂载的镜像盘符 -->
  <Add SourcePath="F:" OfficeClientEdition="64">
    <Product ID="ProPlus2021Retail">
      <Language ID="zh-cn" />
      <Language ID="en-us" />
      <!-- 【核心】排除所有不需要的应用，只留下我们需要的4个 -->
      <ExcludeApp ID="Access" />
      <ExcludeApp ID="Publisher" />
      <ExcludeApp ID="Outlook" />
      <ExcludeApp ID="Onedrive" />
      <ExcludeApp ID="Teams" />
      <ExcludeApp ID="Groove" />
    </Product>
  </Add>
  <Display Level="None" AcceptEULA="TRUE" />
  <!-- 如果您之前已激活，安装后会自动激活 -->
  <Property Name="AUTOACTIVATE" Value="1" />
</Configuration>
 ```
 下面对上述脚本进行解读和修改：  
 ① 第一行``` Add SourcePath="F:" ``` 其中F是第二步中img文件挂载后的盘符，这里F需要根据自己情况修改。  

 ② 可以看到很多行类似```<ExcludeApp ID="Outlook" />```的内容，表示不需要这个组件。例如```<ExcludeApp ID="Outlook" />```就是表示稍后的安装过程中不安装outlook。 好了，现在把你不想要的**组件ID**都写上去吧，以下是id和组件的对应关系：  
<table>
  <thead>
    <tr>
      <th>ID</th>
      <th>组件描述与说明</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>Word</code></td>
      <td>Microsoft Word</td>
    </tr>
    <tr>
      <td><code>Excel</code></td>
      <td>Microsoft Excel</td>
    </tr>
    <tr>
      <td><code>PowerPoint</code></td>
      <td>Microsoft PowerPoint</td>
    </tr>
    <tr>
      <td><code>Outlook</code></td>
      <td>Microsoft Outlook</td>
    </tr>
    <tr>
      <td><code>OneNote</code></td>
      <td>Microsoft OneNote（桌面版）</td>
    </tr>
    <tr>
      <td><code>Access</code></td>
      <td>Microsoft Access</td>
    </tr>
    <tr>
      <td><code>Publisher</code></td>
      <td>Microsoft Publisher</td>
    </tr>
    <tr>
      <td><code>Teams</code></td>
      <td>Microsoft Teams（工作或学校版）</td>
    </tr>
    <tr>
      <td><code>OneDrive</code></td>
      <td>OneDrive 桌面同步客户端</td>
    </tr>
  </tbody>
</table>

对了如果什么都不写，保持我的默认脚本，就是只安装word，excel，powerpoint  。

4. 前置准备下载了setup.exe，在这里用管理员身份打开cmd。输入：
``` cmd
setup.exe /configure config.xml
```
解读：利用微软的setup.exe部署office套件，使用的配置文件是第三步修改得到的config.xml  



### LTSC专业版的安装
完成前置准备后
1. office 版本自定义工具：https://config.office.com/deploymentsettings  
到这个网站填写信息，然后下载微软为你准备的xml配置文件。下载后改名为config.xml。    
2. 基于KMS的 GVLK：https://learn.microsoft.com/zh-cn/deployoffice/vlactivation/gvlks  
3. 以管理员身份运行CMD 进入命令终端  

下载命令：  
``` cmd
setup /download config.xml
```

安装命令
``` cmd
setup /configure config.xml
```

启动命令
```
cd C:\Program Files\Microsoft Office\Office16
cscript ospp.vbs /sethst:kms.03k.org 
cscript ospp.vbs /act
```

注意：kms方式虽然免费，但是kms.03k.org 这个激活服务器不知道是否可信(大部分人都用的这个)，同时也不止这一个激活服务器可用。如果你有方法可以自己搭建或寻找正规激活服务器，以防电脑成为肉鸡。