//Nome da classe
public with sharing class ClasseDemonstraEstrutura { //Inicio da classe

    //metodo da classe, uma classe pode ter vários metodos
    public static boolean nomeDoMetodo(){ //Inicio do metodo

        //TIPO DE VÁRIAVEL | NOME VARIAVEL | VALOR VARIAVEL
        Boolean bTrue = true;
        Boolean bFalse = false;
        String exemploString = 'texto 123456';
        Integer exemploInteiro = 1;
        Decimal exemploDecimal = 1.02;
        Double exemploDouble = 1.20255464454546;

        //Coleções
        List<String> exemploLista = new  List<String>();
        //[0] - Edgar
        //[1] - João Paulo
        //[2] - Arnaldo
        //[3] - Guilherme
        exemploLista.add('Edgar');
        exemploLista.add('João Paulo');
        exemploLista.add('Arnaldo');
        exemploLista.add('Guilherme');
        exemploLista.add('Edgar');
        System.debug('exemploLista =' +exemploLista);
        System.debug('exemploLista posição 2 = ' +exemploLista.get(2)); //Pega a posição de comando
        System.debug('exemploLista tamanho = ' +exemploLista.size());

        
        List<Integer> exemploListaInteger = new List<Integer>();
        System.debug('exemploListaInteger =' +exemploListaInteger);


        //ColeçÃO SET
        set<string> exemploSet = new  set<string>();
        exemploSet.add('Edgar');
        exemploSet.add('João Paulo');
        exemploSet.add('Arnaldo');
        exemploSet.add('Guilherme');
        exemploSet.add('Guilherme');
        exemploSet.add('Guilherme');
        exemploSet.add('Guilherme');
        exemploSet.add('Edgar');
        System.debug('exemploSet =' +exemploSet);
        System.debug('exemploSet tamanho =' +exemploSet.size());

        List<Opportunity> opportunityList = new  List<Opportunity>([SELECT Id, Name FROM Opportunity]);
        System.debug('opportunityList = ' +opportunityList);
        System.debug('opportunityList posição 2 = ' +opportunityList.get(2));
        System.debug('opportunityList posição 2 = ' +opportunityList.get(2).Name);


        return bFalse;

    } //Fim do método

    //Classe sem retorno
    public static void metodoSemRetorno(){
    }

    //Estrutura do SOQL - TODOS UTILIZAR NO DEVELOPER CONSOLER 
    //SELECT
    //Campos
    //FROM
    //nome do objeto
    //WHERE
    //Condição de busca
    // Ex: SELECT Id, Name, Phone FROM Account WHERE Phone = null
    private static List<Account> getAccounts(){
        List<Account> accountList = new  List<Account>([SELECT Id, Name FROM Account Where Id !='']);
        return accountList;
    }

    public static void getAccountPrivate(){
        System.debug(ClasseDemonstraEstrutura.getAccounts());
    }

//Desafio - Montar um metodo que busque e retorne uma lista com todas as oportunidades com a fase igual a "Closed Won"
  Public static List<Opportunity> getOpportunitiesClosedWon(){
    List<Opportunity> oppList = new  List<Opportunity>();

    oppList = [SELECT Id, Name FROM Opportunity WHERE StageName= 'Closed Won'];
    
    System.debug(oppList);
    System.debug('tamanho' +oppList.Size());

    return opplist;
  }

//Exemplo de parametros
public static integer exemploParametros(Integer pInt, Integer pDiv){
    Integer intTest = (10 + pInt)/pDiv;
    System.debug('o valor de inTest é' +intTest);
    return intTest;
}

//DESAFIO - CRIAR UM METODO QUE RECEBE UM NOME DE UMA PESSOA, E IMPRIMA COM SYSTEM DEBUG 'OLÁ NOME'
public static void helloName (String Name, String Sobrenome) {
    System.debug('Olá '+name+' '+sobrenome);
}

//Execução da DML - inserir uma conta  | INSERT-DELETE-UPSERT
Public static Account dmlAccount(String name){
    Account accountObj = new Account();
    accountObj.Name = name;
    insert accountObj; //Inserir a conta

    return accountObj;

}

public static Account dmlAccountUpdate(String name, String idDaConta){

    List<Account> accountList = new List<Account>([SELECT Id, Name FROM Account WHERE Id = :idDaConta]); //Primeiro buscamos as informações
    Account accountObj = accountList.get(0); //Depois pegamos a unica linha que retorna e colocamos no objeto Account
    accountObj.Name = name;
    update accountObj; //Modificar informações

    return accountObj;

}

public static void dmlAccountDelete(String idDaConta){
    List<Account> accountList =  [SELECT Id FROM Account WHERE Id = :idDaConta];
    delete accountList; //DELETAR A CONTA

}

/*  DESAFIO : Receber o sobrenome e o nome da empresa e iremos inserir um LEAD, o método deve retomar
o ID do lead do lead inserid */
public static Id insertLead(String lastName, String companyName){

    Lead leadObj = new Lead();
    leadObj.LastName = LastName;
    leadObj.company = companyName;

    insert leadObj;

    return leadObj.Id;
}//Ao colocar o insert, coloque um ID qualquer da um lead (no CODE APEX)


//Estrutura de condição
public static boolean demonstraEstruturaCondicao(Integer idade){
    //Quero retornar true se a pessoa for maior de idade, senão retorna false
    Boolean bMaiorDeIdade;
    If (Idade <18 ){
        System.debug('Menor de idade');
        bMaiorDeIdade = False;
    }Else{
        System.debug('Maior de idade');
        bMaiorDeIdade = True;
    }
    return bMaiorDeIdade;
    
}

/*
*************************************************************************************
Exemplo:

ENTER APEX CODE:
ClasseDemonstraEstrutura.demonstraEstruturaCondicao(IDADE TESTE);
*************************************************************************************
*/ 


public static void demonstraEstruturaCondicao2(Integer idade){

    if(idade < 0 || idade == null){
        system.debug('Idade Inválida');
    }else{
    If (Idade <13 ){
        System.debug('Criança');
    }else if(idade >= 13 && idade <=21){
        System.debug('Adolescente');
    }else if(idade > 21 && idade < 65){
        System.debug('Adulto');
    }else{
        System.debug('Idoso');
     }
  }
}

/*
*************************************************************************************
Exemplo:

ENTER APEX CODE:
ClasseDemonstraEstrutura.demonstraEstruturaCondicao2(FASE DA VIDA);
*************************************************************************************
*/ 



/*
DESAFIO:
Construir um metodo que receba dois parâmetros do tipo inteiro e retorne a soma destes dois parâmetros
Se o parâmetro 1 for maior do 5 deve somar mais dois neste resultado.
*/ 
public static Integer somaDoisValoresComIf(Integer p1, Integer p2){
    Integer resultado = p1 + p2;
    If(p1 > 5){
        resultado = resultado + 2;
    }
    system.debug('Resultado ' +resultado);
    return resultado;
}

/*
*************************************************************************************
RESULTADO DO DESAFIO :

ENTER APEX CODE:
ClasseDemonstraEstrutura.somaDoisValoresComIf(NUMERO EXEMPLO, NUMERO EXEMPLO);
*************************************************************************************
*/ 




//ESTRTURA DE REPETIÇÃO
public static Decimal getOpportunitiesTotal(){
    Decimal total = 0;
    List<Opportunity> opportunityList = new List<Opportunity>([SELECT Amount FROM Opportunity]);

    for(Opportunity vTemp : opportunityList){
        total = total + vTemp.Amount;

    }
    System.debug('valor total das oportunidades =' +total);
    Return total; 
}

/*
*************************************************************************************
Outra forma de fazer a estrutura anterior (acima)

public static Decimal getOpportunitiesTotal2(){
    Decimal total = 0;
    List<Opportunity> opportunityList = new List<Opportunity>([SELECT Amount FROM Opportunity]);

    for(Opportunity vTemp : [SELECT Amount FROM Opportunity]{
        total += vTemp.Amount;

    }
    System.debug('valor total das oportunidades = '+total);
    Return total; 
*******


RESULTADO DA ATIVIDADE (REFERENTE AO PRIMEIRO FOR):

****
ENTER APEX CODE:
ClasseDemonstraEstrutura.getopportunitiesTotal();
****

RESULTADO:

O VALOR DA OPORTUNIDADE É: 5760000.00
*************************************************************************************
*/ 


//DESAFIO 1: Buscar e retornar o valor total das oportunidades que a fases não sejam 'Closed Lost'
public static Decimal getOpportunitiesTotalDesafio(){
    Decimal total = 0;

    For(Opportunity vTemp: [SELECT Amount FROM Opportunity WHERE StageName != 'Closed Won' AND StageName != 'Closed Lost']){
        total += vTemp.Amount; //Faz a soma e mantem o valor anterior
    }
    System.debug('total ' +total);
    return total;
}

//OU 

public static Decimal getOpportunitiesTotalDesafio2(){
    Decimal total = 0;
    //AQUI FIZEMOS A QUERY DIFERENTE UTILIZANDO O NOT IN
    For(Opportunity vTemp: [SELECT Amount FROM Opportunity WHERE StageName NOT IN
    ('Closed Won','Closed Lost')]){
        total += vTemp.Amount; 
   }
   return total;
}

/*
APEX CODE:
ClasseDemonstraEstrutura.getOpportunitiesTotalDesafio();

DEBUG|total 2115000.00
*/ 



//DESAFIO 2: Criar 10 contas com o nome 'Conta 1', 'Conta 2', e assim por diante. Não retornar nada.

public static void inserAccountsModoErrado(){
    //Isso é errado, pois estamos acessando o banco de dados várias vezes, e isso pode dar erro de limite de DML
    for(Integer iTemp = 1; iTemp <=10; iTemp++){
        System.debug('iTemp '+iTemp);
        Account accountObj = new Account();
        accountObj.Name = 'Conta '+iTemp;
        insert accountObj;
    }
  
}


public static void inserAccountsModoCerto(){
    List<Account> accountList = new List<Account>();
    for(Integer iTemp = 1; iTemp <=10; iTemp++){
        System.debug('iTemp '+iTemp);
        Account accountObj = new Account();
        accountObj.Name = 'Conta '+iTemp;
        accountList.add(accountObj);
    }
    insert accountList;

}

/*
APEX CODE:
ClasseDemonstraEstrutura.inserAccountsModoCerto();
****
Adicionou 10 contas de uma vez
*/ 



//DESAFIO 3: Receber um número inteiro no parâmetro, e vão criar as contas conforme este número com o nome 'Conta Desafio 1', 'Conta DESAFIO 2';
public static void insertAccountsDesafio(Integer quantidadeContas){
    List<Account> accountList = new List<Account>();

    for(Integer iTemp = 1; iTemp <= quantidadeContas; iTemp++){
        Account accountObj = new Account();
        accountObj.Name = 'Conta DESAFIO '+iTemp;   
        accountList.add(accountObj);

    }
    insert accountList;
}

/*
APEX CODE:
ClasseDemonstraEstrutura.insertAccountsDesafio();
*/ 



//MAPS
public static void demonstraMAP(){
    List<Opportunity> opportunityList = new List<Opportunity>([SELECT Id, Name FROM Opportunity]);
    for(Opportunity vTemp : OpportunityList){
        If(vTemp.Id == '0068c00000rzsEVAAY' ){

        }

    }

//Mapas
Map<Id, Opportunity> opportunityMap = new Map<Id, Opportunity>([SELECT Id, Name FROM Opportunity]);
system.debug('opportunityMap '+opportunityMap);

}



//FOR com repetição sem coleção
//Temos que receber um valor e ataves desse valor mostra o texto : Texto 1, Texto 2, e assim por diante.
public static void mostraTextos(Integer numberText){

    for(Integer iTemp = 0; iTemp <= numberText; iTemp++ ){
        System.debug('Texto '+iTemp);
    }
}


//DESAFIO - 10 contas. Criar 10 contas com o nome 'Conta 1', 'Conta 2', e assim por diante. Não retornar nada
public static void createAccounts(){
    for(Integer i = 1; i <=10; i++){
        Account accountObj = new Account();
        accountObj.Name = 'Conta '+i;
        Insert accountObj;
    }
}


public static void createAccountCorrect(){
    List<Account> accountList = new List<Account>();
    for(Integer i ; i <=10; i++){
        Account accountObj = new Account();
        accountObj.Name = 'Conta '+i;
        accountList.add(accountObj);
    }
    Insert accountList;
}

public static void createAccounts2(Integer ValorInserir){
    for(Integer i = 1; i <= ValorInserir; i++){
        Account accountObj = new Account();
        accountObj.Name = 'Conta '+i;
        Insert accountObj;
    }
}


//MAP - Entendimento 
public static void mapClass1(){
    List<String> stringList = new List<String>();
    stringList.add('x3');
    stringList.add('x4');
    stringList.add('x2');
    stringList.add('x1');

    Integer position = 1;
    for(String sTemp : stringList){
        if(sTemp == 'x2'){
            system.debug('O x2 esta na posição  '+position);
        }
        position++;
    }

        /*
        APEX CODE:
        ClasseDemonstraEstrutura.mapClass1();
        ****
        resposta do debug:
        DEBUG|O x2 esta na posição  3
        */ 


    //Primeiro a chave e depois a coleção
    Map<String, Integer> StringMap = new Map<String, Integer>();
    stringMap.put('X3',0);
    stringMap.put('X4',1);
    stringMap.put('X2',2);
    stringMap.put('X1',3);
    system.debug('Contem a chave ? ' +stringMap.containsKey('X2'));
}

//

 public static void veriFyLeadErrado(){
    
    for(Integer i ; i < 10; i++){
    String companyName = 'Company '+i;
    List<Lead> leadList = new List<Lead>([SELECT Company FROM Lead 
    WHERE Company = :companyName]);

        if(leadList.size() ==0){
            Lead leadObj = new Lead ();
            leadObj.LastName = 'LastName '+i;
            leadObj.Company = 'companyName';
            Insert leadObj;
        }
    }
}

//

public static void veriFyLeadCorreto(){
    Map<String, Lead> leadMap = new Map<String, Lead>();
    for(Lead vTemp : [SELECT Id, Company, LastName FROM Lead]){
        leadMap.put(vTemp.Company, vTemp);
    }

    List<Lead> leadList = new List<Lead>();
    for(Integer i; i < 10; i++){
        String companyName = 'Company '+i;

        if(!leadMap.containsKey(companyName)){
            Lead leadObj = new Lead ();
            leadObj.LastName = 'LastName '+i;
            leadObj.Company = companyName;
            leadList.add(leadObj);
        }else{
            Lead leadObj = leadMap.get(companyName);
            system.debug('O lead já existe com o sobrenome' +leadObj.LastName);
        }
     }
     Insert leadList;
  }
    

//DESAFIO: Criar um metodo que recebe um inteiro, e crie a quantidade de contas passadas neste pãrametro, mas temos que verificar se a conta não existe. Se ela existir, não se deve inserir. Este metodo não deve retornar nada.
       //Roteiro de execução:
    
       // 1- Criar o método
    public static void createAccountsWithParameter(Integer qtyAccounts){ 
    
        // 2- Criar um mapa
        Map<String, Account> accountMap = new Map<String, Account>();
    
        //Aqui pré carrego os nomes das contas que devem ser criadas para diminuir o tamanho do resultado da consulta ao banco de dados
        List<String> namesList = new List<String>();
        for(Integer i = 1 ; i <= qtyAccounts; i++){
            namesList.add('Conta '+i);
        }

    // 3- O mapa deve guardar a lista de contas
         for(Account vTemp : [SELECT Id, Name FROM Account WHERE Name IN : namesList]){
             accountMap.put(vTemp.Name, vTemp);
        }

        List<Account> accountList = new List<Account>();
    
    // 4- Executar o for
        for(Integer i = 1 ; i <= qtyAccounts; i++){
            String nameAccount = 'Conta '+i;
    
        // 5- Verificar se a conta existe
            if(!accountMap.containsKey(nameAccount)){
                Account accountObj = new Account();
                accountObj.Name = nameAccount;
                accountList.add(accountObj);
            }
        }

    // 6- Inserir contas
    insert accountList;
    }


    /*Obsevação da atividade:
    Foi inserida apartir da conta 11 até a 20º conta, por ja ter sido criada da 1 á 10º, o método criado deu continuidade na criação de + Contas.


    Apex Code:
    ClasseDemonstraEstrutura.createAccountsWithParameter(20);
    */


//O mapa serve para - Armazernar informações e para serem recuperadas através de uma chave.









    


}//Fim do corpo da classe

