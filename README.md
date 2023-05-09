# Vleko.TemplateProject
Your Project Description Here..

## Migration Data
Run "Database.sql" di sql server untuk membuat database dan generate table

## Use Code Generator
### 1.Install tool
klik kanan di project Vleko.TemplateProject.Data kemudian pilih open in terminal kemudian ketik :
```powershell
dotnet tool install --global dotnet-ef 
atau
dotnet tool update --global dotnet-ef
```
### 2.Scaffolding 
setelah mengeksekusi install tool kemudian ketik/copy code berikut :
```scaffold
<!--#if(Database=="postgre") -->
dotnet ef dbcontext scaffold "Host=localhost;Database=Vleko.TemplateProject;Username=[YOUR_USERNAME];Password=[YOUR_PASSWORD]" Npgsql.EntityFrameworkCore.PostgreSQL --output-dir "..\Vleko.TemplateProject.Data\Model" -c ApplicationDBContext --context-dir "..\Vleko.TemplateProject.Data" --namespace "Vleko.TemplateProject.Data.Model"  --context-namespace "Vleko.TemplateProject.Data" --no-pluralize -f --no-onconfiguring --schema "public"
<!--#endif -->
<!--#if(Database=="mssql") -->
dotnet ef dbcontext scaffold "Data Source=localhost;Initial Catalog=Vleko.TemplateProject;Integrated Security=True" Microsoft.EntityFrameworkCore.SqlServer --output-dir "..\Vleko.TemplateProject.Data\Model" -c ApplicationDBContext --context-dir "..\Vleko.TemplateProject.Data" --namespace "Vleko.TemplateProject.Data.Model" --context-namespace "Vleko.TemplateProject.Data" --no-pluralize -f --no-onconfiguring --schema "dbo"
<!--#endif -->
```
ganti localhost username dan password apabila ingin merubah koneksi ke server yang dituju.

### 3.Generated file
show all files di project Vleko.TemplateProject.Data maka akan terbentuk file *generated" dan didalamnya terdapat backend dan frontend disana tinggal copy paste saja kedalam core untuk kebutuhan table.

## Use DAL
untuk cara pemakain bisa dibaca di [Vleko.DAL](https://github.com/Vlekops/DAL)


