/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 07-12-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/

public with sharing class Carro {
    

    //Atributos do carro
    public string modelo {get; set;}
    public string cor {get; set;}
    public Boolean ligado {get; set;}
    public Integer velocidadeCarro {get; set;}
    public Boolean estadoPorta {get; set;} //false - é porta fechada

    //DESAFIO -  No carro crie um metodo chamado 'Acelerar', passar nesse metodo o número da velocidade. Retornar a mesma velocidade.
    //No motorista você deve mandar para o carro o valor da velocidade, porém só pode acelerar se o carro estiver ligado.
    public boolean acelerar(Integer velocidade){
        return velocidade > 0 && velocidade !=null && this.ligado == true ? true : false;
    }

        

        /*public Boolean ligarCarro(Boolean ligarCarro){
            Boolean carroLigado = ligarCarro ? true : false;
            if(ligarCarro == true){
                system.debug('Ligou o carro');
            }else{
                system.debug('Desligou o carro');
            }
            return ligouFarol;
        }
        
        public Boolean ligarFarois(Boolean ligarFarois){
            Boolean ligarFarois = ligarFarois ? true : false;
            if(ligarFarois == true){
                system.debug('Ligou os farois');
            }else{
                system.debug('Desligou o carro');
            }
            return ligouFarol;
        }

        public Boolean ligarSeta(Boolean ligarSeta){
            Boolean ligouSeta = ligarSeta ? true : false;
            if(ligarSeta == true){
                system.debug('Ligou os farois');
            }else{
                system.debug('Desligou o carro');
            }
            return ligouFarol;
        }



        */
    }


}