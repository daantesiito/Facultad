public abstract class ReportGeneratorRefactoring {

    public void getAuthors(Document document, DocumentFile docFile) {
        String authors = "";
        for (String author : document.getAuthors()) {
            authors += " " + author;
        }
        docFile.setAuthors(authors);
    }

    public abstract void exportContent(DocumentFile docFile, Document document);

    public abstract void configureMetadata(DocumentFile docFile);

    public void generateReport(Document document) {
        // crear documento y configurar metadatos
        DocumentFile docFile = new DocumentFile();
        docFile.setTitle(document.getTitle());

        this.getAuthors(document, docFile); // Nuevo
        
        this.configureMetadata(docFile); // Nuevo

        this.exportContent(docFile, document); // Nuevo

        // guardar el documento
        this.saveExportedFile(docFile);
    }

}
