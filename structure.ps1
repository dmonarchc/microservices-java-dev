# Ruta base del proyecto
$base = "C:\Users\ciste\OneDrive\Escritorio\Code\Java\microservices-java-dev"

# Definir capítulos (nombre carpeta, y si lleva código o no)
$chapters = @(
    @{ name = "chapter-01-microservices-intro"; hasCode = $false },
    @{ name = "chapter-02-spring-boot"; hasCode = $true },
    @{ name = "chapter-03-dropwizard"; hasCode = $true },
    @{ name = "chapter-04-wildfly-swarm"; hasCode = $true },
    @{ name = "chapter-05-docker-kubernetes"; hasCode = $true },
    @{ name = "chapter-06-cluster-failover"; hasCode = $true },
    @{ name = "chapter-07-where-next"; hasCode = $true }
)

# Crear estructura
foreach ($ch in $chapters) {
    $chapterPath = Join-Path $base $ch.name
    New-Item -ItemType Directory -Path $chapterPath -Force | Out-Null

    # Crear carpeta docs/
    New-Item -ItemType Directory -Path (Join-Path $chapterPath "docs") -Force | Out-Null

    # Crear carpeta src/ si aplica
    if ($ch.hasCode) {
        New-Item -ItemType Directory -Path (Join-Path $chapterPath "src") -Force | Out-Null
    }

    # Crear README.md por capítulo
    $readmePath = Join-Path $chapterPath "README.md"
    "## ${($ch.name -replace '-', ' ').ToUpper()}`nWork in progress." | Out-File -Encoding UTF8 -FilePath $readmePath
}

# Crear README.md raíz
"## Microservices for Java Developers`nThis repository follows the book chapter by chapter." | Out-File -Encoding UTF8 -FilePath (Join-Path $base "README.md")

# Crear .gitignore
"target/`nbuild/`n*.class`n*.log`n.env" | Out-File -Encoding UTF8 -FilePath (Join-Path $base ".gitignore")

