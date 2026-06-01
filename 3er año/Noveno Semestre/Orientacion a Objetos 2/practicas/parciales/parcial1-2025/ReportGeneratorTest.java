class ReportGeneratorTest {
    ReportGenerator generatorPDF;
    ReportGenerator generatorXLS;
    Document document;

    @BeforeEach
    void setUp() {
        document = new Document("Informe");
        document.addAuthor("Carlos");
        document.addAuthor("Ana");

        generatorPDF = new ReportGenerator("PDF");
        generatorXLS = new ReportGenerator("XLS");
    }

    @Test
    void testPDF() {
        generatorPDF.generateReport(document);
        // aca se detallan los asserts
    }

    @Test
    void testXLS() {
        generatorXLS.generateReport(document);
        // aca se detallan los asserts
    }
}
