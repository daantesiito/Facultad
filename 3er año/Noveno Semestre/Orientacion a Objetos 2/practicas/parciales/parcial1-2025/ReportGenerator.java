public class ReportGenerator {

    private String type;

    public ReportGenerator(String type) { 
        this.type = type;
    }

    public void generateReport(Document document) {
        // crear documento y configurar metadatos
        DocumentFile docFile = new DocumentFile();
        docFile.setTitle(document.getTitle());
        String authors = "";
        for (String author : document.getAuthors()) {
            authors += " " + author;
        }
        docFile.setAuthors(authors);
        docFile.setContentType("application/pdf");
        docFile.setPageSize("A4");

        // crear exportador y setear el contenido
        PDFExporter exporter = new PDFExporter();
        byte[] content = exporter.generatePDFFile(document);
        docFile.setContent(content);

        // guardar el documento
        this.saveExportedFile(docFile);
    }

    if (type.equals("XLS")) {
        // crear documento y configurar metadatos
        DocumentFile docFile = new DocumentFile();
        docFile.setTitle(document.getTitle());
        String authors = "";
        for (String author : document.getAuthors()) {
            authors += " " + author;
        }
        docFile.setAuthors(authors);
        docFile.setContentType("application/vnd.ms-excel");
        docFile.setSheetName(document.getSubtitle());

        // crear exportador y setear el contenido
        ExcelWriter writer = new ExcelWriter();
        byte[] content = writer.generateExcelFile(document);
        docFile.setContent(content);

        // guardar el documento
        this.saveExportedFile(docFile);
    }

}
