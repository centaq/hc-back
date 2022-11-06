import { parentPort } from "worker_threads";

export class homeDefinition {
    public static stateTable: string = 'state';
    public static confTable: string = 'conf';

    private static def: any = {
        0: {
            1: { //podlewanie
                0: 1, //`watering_enable`,
                1: 'outputs_05 & (1 << 0) != 0',
                2: 'outputs_05 & (1 << 0) != 0',
                3: 'outputs_05 & (1 << 0) != 0',
                101: 0,//'watering_auto_00 & (1 << 0) != 0',
                102: 1,//'watering_auto_00 & (1 << 1) != 0'
                103: 0
            },
            2: { //oswietlenie zewnetrzne
                0: 'outputs_05 & (1 << 0) != 0', //swiatlo nad garazem
                100: '0' //kolumna z pozostalym czasem do wylaczenia
            },
            15: { //zewnątrz
                1: 'temperature_28', //temperatura
                2: 'light_level_00', //swiatlo
                3: 'humidity_00', //wilgotnosc
                4: 'pressure_00',
            }
        },
        1: {
            1: { //wiatrołap
                1: 'temperature_05'
            },
            2: { //hol
                1: 'temperature_21'
            },
            3: { //łazienka
                1: 'temperature_06'
            },
            4: { //salon
                1: 'temperature_26',
                2: 'temperature_24'
            },
            5: { //jadalnia
                1: 'temperature_22'
            },
            6: { //kuchnia
                1: 'temperature_20'
            },
            7: { //gabinet
                1: 'temperature_09'
            },
            8: { //garaż
                1: 'temperature_23'
            },
            9: { //spiżarnia
                1: 'temperature_07'
            },
            10: { //kotlownia
                1: 'temperature_27', //temperatura
                2: 'smoke_level_02', //smoke
                3: homeDefinition.previousRecord('water_meter_00'),
                4: 'fuel_level_00',
                5: 'temperature_43', // temperatura CWU
                20: 'outputs_05 & (1 << 0) != 0',
                21: 'outputs_05 & (1 << 1) != 0',
                22: 'outputs_05 & (1 << 2) != 0',
                23: 'outputs_05 & (1 << 3) != 0',
                24: 'outputs_05 & (1 << 4) != 0',
                25: 'outputs_05 & (1 << 5) != 0',
                26: 'outputs_05 & (1 << 6) != 0',
                27: 'outputs_05 & (1 << 7) != 0',

                30: 'outputs_00 & (1 << 0) != 0',
                31: 'outputs_00 & (1 << 1) != 0',
                
                50: 'pressure_level_00',
                51: 'pressure_level_01',
                52: 'pressure_level_02',
                53: 'pressure_level_03',
            },
            14: { //szafa
                1: 'temperature_42', //temperatura
                10: 'energy_meter_03', //eneergia całkowita
                11: 'energy_meter_00',  //energia studnia
                12: 'energy_meter_01', //eneergia kotlownia
                13: 'energy_meter_02',  //energia szafa
                14: 'energy_meter_04', //eneergia teletechnika
                15: homeDefinition.diffValue('energy_meter_03'), //eneergia całkowita
                16: homeDefinition.diffValue('energy_meter_00'),  //energia studnia
                17: homeDefinition.diffValue('energy_meter_01'), //eneergia kotlownia
                18: homeDefinition.diffValue('energy_meter_02'),  //energia szafa
                19: homeDefinition.diffValue('energy_meter_04') //eneergia teletechnika
            }
        },
        2: {
            1: { //korytarz góra
                1: 'temperature_10'
            },
            2: { //sypialnia
                1: 'temperature_13'
            },
            3: { //garderoba
                1: 'temperature_11'
            },
            4: { //P1
                1: 'temperature_14'
            },
            5: { //P2
                1: 'temperature_15'
            },
            6: { //łazienka góra
                1: 'temperature_18'
            },
            7: { //bawialnia
                1: 'temperature_12'
            },
            8: { //pralnia
                1: 'temperature_04'
            },
            9: { //P3
                1: 'temperature_16'
            },
            10: { //P4
                1: 'temperature_17'
            },
            14: { //szafa
                1: 'temperature_00', //temperatura
                2: 'smoke_level_00',
                3: 'smoke_level_00',
                4: 'smoke_level_00'
            },
            15: { //pokoj biurowy
                1: 'temperature_12', //temperatura
                2: 'temperature_10', //temp grzejnik zasilanie
                3: 'temperature_13', //temp grzejnik powrot
                4: 'outputs_05 & 1 != 0' //swiatlo awaryjne
            },
            16: { //nasz pokoj
                1: 'temperature_08', //temperatura podłoga
                2: 'temperature_11', //temp środek
                3: 'temperature_09', //temp wysoko
                4: 'outputs_05 & (1 << 1) != 0',   //swiatlo awaryjne
                5: 'outputs_05 & (1 << 2) != 0',   //swiatlo duze
                6: 'leds_00'
            }
        },
        3: {//strych
            1: {
                1: 'temperature_19' // wylaz dachowy
            }
        },
        10: {
            0: { //woda
                1: 'pressure_level_00',  //cisnienie wody
                2: 'NOT ' + this.output(21),  //zamówr wody
                3: 'NOT ' + this.output(121)  //przekaznik pompy
            },
            10: { //alarm
                0: 'last_movement_00', //'wiatrolap'
                1: 'last_movement_01', //'lazienka'
                2: 'last_movement_02', //'kuchnia'
                3: 'last_movement_03', //'gabinet'
                4: 'last_movement_04', //'hall'
                5: 'last_movement_05', //'jadalnia'
                6: 'last_movement_06', //'salon'
                7: 'last_movement_07', //'garaz'
                8: 'last_movement_08', //'spizarnia'
                9: 'last_movement_09', //'kotlownia'
                10: 'last_movement_10', //'schody'
                11: 'last_movement_11', //'korytarz'
                12: 'last_movement_12', //'sypialnia'
                13: 'last_movement_13', //'garderoba'
                14: 'last_movement_14', //'P1'
                15: 'last_movement_15', //'P2'
                16: 'last_movement_16', //'lazienka'
                17: 'last_movement_17', //'bawialnia'
                18: 'last_movement_18', //'pralnia'
                19: 'last_movement_19', //'P3'
                20: 'last_movement_20', //'P4'
                21: 'last_movement_21', //'gospodarczy'
                22: 'last_movement_22', //'alarm wejsce zewnatrz'
                23: 'last_movement_23', //'alarm taras zewnatrz'
            },
            11: {
                0: 'LEAST(9999, last_movement_00, last_movement_01, last_movement_02, last_movement_03, last_movement_04, last_movement_05, last_movement_06, last_movement_10)', //'parter'
                1: 'LEAST(9999, last_movement_07, last_movement_08, last_movement_09)', //garaz
                2: 'LEAST(9999, last_movement_11, last_movement_12, last_movement_13, last_movement_14, last_movement_15, last_movement_16, last_movement_17, last_movement_18, last_movement_19, last_movement_20)', //'pietro'
                3: 'LEAST(9999, last_movement_21)', //'gospodarczy'
                4: 'LEAST(9999, last_movement_22, last_movement_22)', //'zewnetrzne'
            },
            20: { //ogrzewanie
                1: 'outputs_00 & (1 << 0) != 0', //salon
                2: 'outputs_00 & (1 << 1) != 0', //wykusz
                3: 'outputs_00 & (1 << 2) != 0', //kuchnia
                4: 'outputs_00 & (1 << 3) != 0', //gabinet
                5: 'outputs_00 & (1 << 4) != 0', //hol
                6: 'outputs_00 & (1 << 5) != 0', //wiatrolap
                7: 'outputs_00 & (1 << 6) != 0', //lazienka
                8: 'outputs_00 & (1 << 7) != 0', //garaz
                15: 'outputs_01 & (1 << 1) != 0', //korytarz
                16: 'outputs_03 & (1 << 0) != 0', //sypialnia
                17: 'outputs_03 & (1 << 1) != 0', //bawialnia
                18: 'outputs_03 & (1 << 2) != 0', //p1
                19: 'outputs_03 & (1 << 3) != 0', //p2
                20: 'outputs_03 & (1 << 4) != 0', //lazienka
                21: 'outputs_03 & (1 << 5) != 0', //bawialnia
                22: 'outputs_03 & (1 << 6) != 0', //pralnia
                23: 'outputs_03 & (1 << 7) != 0', //P3
                24: 'outputs_02 & (1 << 0) != 0' //P4
            },
            21: {
                0: 'outputs_02 & (1 << 3) != 0', //pompa dół
                1: 'outputs_02 & (1 << 4) != 0' //pompa góra
            },
            30: {
                0: 'inputs_04 & (1 << 5) != 0', //S32 - pompy
                1: 'inputs_04 & (1 << 4) != 0' //S34 - elektrozawory
            }
        }
    }

    private static confDef: any = {
        10: {
            20: {
                0: 'set_temperature_00', //wiatrolap 
                1: 'set_temperature_01', //hol 
                2: 'set_temperature_02', //lazienka 
                3: 'set_temperature_03', //wykusz 
                4: 'set_temperature_04', //kuchnia
                5: 'set_temperature_05', //gabinet
                6: 'set_temperature_06', //salon
                7: 'set_temperature_07', //garaz
                8: 'set_temperature_08', //korytarz
                9: 'set_temperature_09', //sypialnia
                10: 'set_temperature_10', //bawialnia
                11: 'set_temperature_11', //p1
                12: 'set_temperature_12', //p2
                13: 'set_temperature_13', //lazienka
                14: 'set_temperature_14', //bawialnia
                15: 'set_temperature_15', //pralnia
                16: 'set_temperature_16', //P3
                17: 'set_temperature_17' //P4
            }
        }
    }

    public static output(no: number) : string {
        var port = String(Math.floor(no / 8)).padStart(2, '0');
        var pin = no % 8;
        return 'outputs_' + port + ' & (1 << ' + pin + ') != 0';
    }

    public static diffValue(col: string) : string {
        return '(SELECT c.val - d.val FROM (SELECT ' + col + ' AS val FROM `state` ORDER BY ID DESC LIMIT 1) AS c, (SELECT ' + col + ' AS val FROM `state` WHERE `date` < SUBDATE(NOW(), INTERVAL 1 WEEK) AND `date` > SUBDATE(SUBDATE(NOW(), INTERVAL 1 WEEK), INTERVAL 1 MINUTE) LIMIT 1) as d)';
    }

    public static previousRecord(col: string, hours: number = 1): string {
        return 'ROUND(' + col + ' - ( SELECT c.' + col + ' FROM ' + this.stateTable + ' AS c WHERE c.`date` < SUBTIME(' + this.stateTable + '.`date`, "' + hours + ':0:0") ORDER BY ID DESC LIMIT 1,1) ,3)';
    }

    public static translateToStateSql(sensor: string) {
        let path: string[] = sensor.split('.');
        let val = this.def;
        try {
            for(let p in path) {
                val = val[path[p]];
            }
        } catch {
            return 0;
        }
        return val;
    }

    public static translateToConfSql(sensor: string) {
        let path: string[] = sensor.split('.');
        let val = this.confDef;
        try {
            for(let p in path) {
                val = val[path[p]];
            }
        } catch {
            return 0;
        }
        return val;
    }

}