<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>

    <jsp:attribute name="header">
         Hjem
    </jsp:attribute>

    <jsp:attribute name="footer">
        <c:set var="addHomeLink" value="${false}" scope="request"/>
    </jsp:attribute>

    <jsp:body>
        <main>
            <div class="container pagetitelblock titlesearch" style="margin-top: 54px">
                <div class="row">
                    <div class="col-md-12">
                        <a href="${pageContext.request.contextPath}/fc/requestpage">
                            <img src="${pageContext.request.contextPath}/images/carport_quickbyg.jpg">
                        </a>
                    </div>
                </div>
            </div>
        </main>
        <section>
            <div class="container">
                <div class="col-md-12">
                    <div class="xhtml-string">
                        <h1>UDVALGET I FOG TRÆLAST OG BYGGECENTER</h1>
                        <p>Hos Fog Trælast & Byggecenter har vi et sortiment som spænder bredt indenfor byggematerialer,
                            bolig, have & fritid og værktøj. Heriblandt kan nævnes varer som de flotte sibiriske
                            terrassebrædder, økonomiske varmegenvindings ventilatorer, batteridrevne hækkeklippere og
                            bore-/skruemaskiner. Danskerne er mestre i at gøre det selv, er det også gældende for dig?
                            Så
                            udforsk vores komplette varelager, vi har lige hvad du går og mangler. Gør-det-selv er ikke
                            farligt, vær villig til at prøve det af, der er penge at spare og en stor tilfredsstillelse
                            af
                            at være herre i eget hus venter. Så hvis du er et havemenneske, gør-det-selv-mand eller bare
                            har
                            brug for noget værktøj til at fixe de praktiske gøremål, så gå på opdagelse i vores mange
                            spændende varer på webshoppen.
                        </p>
                        <h1>GØR-DET-SELV PROJEKTER</h1>
                        <p>Det viser sig at færre danskere selv vedligeholder eller foretager forbedringer i hjemmet. Dette
                            er måske fordi, at det i dag ikke handler i så høj grad om besparelser længere for danskerne,
                            men derimod mere om fornøjelse. Fornøjelsen er nemlig stor hos danskerne, når det kommer til
                            gør-det-selv projekter. Der foretages også flere og flere bolighandler i Danmark. Er du en af
                            boligkøberne? Og skal du i gang med et renoveringsprojekt? Så er Fog Trælast & Byggecenter
                            stedet, hvor du finder de bedste materialer og det mest hensigtsmæssige værktøj til jobbet. Skal
                            du ligesom omtrent halvdelen af boligkøberne bruge maling din nye bolig, så finder du hos os et
                            stort udvalg i maling og udstyr til formålet. Det kan også være, at du ligesom knap 20% af
                            danskerne skal have lagt nyt gulv eller loft, så hjælper vi gerne i Fog Trælast & Byggecenter
                            til med at finde den rette løsning til dig.
                        </p>
                        <h1>ALT TIL BOLIGEN</h1>
                        <p>Der kan være mange grunde til at renovere eller tilfører nye elementer til sin bolig. Af
                            forskellige årsager kan nævnes at elementer i boligen er nedslidt, hjemmets rammer er ikke
                            tilsvarende med tiden eller måske handler det for dig mere om fornyelse som hænger sammen med
                            familiens aktuelle behov? Hvad end din årsag er, så kan du finde de rette løsninger i vores
                            Byggecenter og Trælast. Skal der ske noget ude på badeværelset, så kan du bl.a. finde armaturer
                            og ventilationsløsninger. Trænger dine døre til at friskes op? Så udforsk vores dørgreb, hvor vi
                            bl.a. har flotte varianter fra Arne Jacobsen. Går du ligesom os meget op i optimal
                            udendørsbelysning så find de rette sensorlamper i Fog Trælast og Byggecentre til din indkørsel.
                            Synes du et pænt hjem og lyse rum er to ord for det samme, så få inspiration til at udleve dine
                            boligdrømme i Fog Trælast og Byggecenter.
                        </p>
                        <h1>ALT TIL HAVEN</h1>
                        <p>Hvad enten du er på udkig efter de mest basale redskaber til haven eller du vil give dig selv
                            titlen som professionel havemand – så find alt hvad du mangler i Fog Trælast og Byggecenter.
                            Oplever du ligesom mange andre danskere en stor afspændthed og velvære ved at komme i haven, så
                            har vi et stort sortiment, som kan hjælpe dig til at udleve dine havedrømme. Handler det for dig
                            om, at haven skal være et samlingspunkt for familien, så udforsk vores mange hyggelige og
                            sjælrige havemøbler. Er du måske mere på udkig efter haveartikler til at ordne de praktiske
                            ting, så har vi alt du skal bruge til at etablere og passe bedet, alt til pasning af græsplæne
                            og hæk f.eks. plæneklippere, ukrudtsmiddel, hækkeklippere og græstrimmere. Skal du have hjælp
                            til beklædningen, et redskabsskur til dine redskaber eller måske et nyt hegn, så står vi hos Fog
                            Trælast og Byggecenter klar til at hjælpe.
                        </p>
                    </div>


                </div>
            </div>
        </section>

    </jsp:body>
</t:genericpage>