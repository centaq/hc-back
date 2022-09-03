export class homeDefinition {
    public static stateTable: string = 'state';

    private static def: any = {
        0: {
            1: { //podlewanie
                0: 1, //`watering_enable`,
                1: 'outputs_05 & (1 << 0) != 0',
                2: 'outputs_05 & (1 << 0) != 0',
                101: 0,//'watering_auto_00 & (1 << 0) != 0',
                102: 1//'watering_auto_00 & (1 << 1) != 0'
            },
            15: { //zewnątrz
                1: 'temperature_40', //temperatura
                2: 'light_level_00', //swiatlo
                3: 'humidity_00', //wilgotnosc
                4: 'pressure_00'
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
            },
            100: { //woda
                1: 'pressure_level_00',  //cisnienie wody
                2: 'NOT ' + this.output(21),  //zamówr wody
                3: 'NOT ' + this.output(121)  //przekaznik pompy
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

    public static translateToSql(sensor: string) {
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

}