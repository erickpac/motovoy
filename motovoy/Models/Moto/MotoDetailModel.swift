//
//  MotoDetailModel.swift
//  motovoy
//
//  Created by Erick Pac on 5/9/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

struct MotoDetail: Codable {
    var id: Int?
    var motoModelId: Int?
    var motoCategoryId: Int?
    var validated: Int?
    var generalName: String?
    var generalType: String?
    var generalLicenseType: String?
    var generalSeats: Int?
    var generalYearStart: Int?
    var generalYearEnd: Int?
    var generalUserManual: String?
    var generalMaintenanceManual: String?
    var generalMakerName: String?
    var generalMakerWeb: String?
    var generalMakerImporter: String?
    var generalMakerImporterWeb: String?
    var motorCC: Int?
    var motorKW: Int?
    var motorCycle: Int?
    var motorDisposition: Int?
    var motorDistribution: Int?
    var motorTraction: Int?
    var motorCylinders: Int?
    var motorValves: Int?
    var motorFeeding: Int?
    var motorRefrigeration: Int?
    var motorDiameterPerRace: Int?
    var motorCompression: Int?
    var motorMaxPower: Int?
    var motorDeclaredMaxPair: Int?
    var motorGas: Int?
    var motorAntipollutionRegulation: Int?
    var motorLimitation: Int?
    var motorAirFilterMaterial: Int?
    var ignitionIgnition: Int?
    var ignitionBattery: Int?
    var transmisionGear: Int?
    var transmisionSecondaryTransmition: Int?
    var transmisionTransmitionSwitch: Int?
    var transmisionGearNum: Int?
    var transmisionPrimaryRelation: Int?
    var transmisionFinalRelation: Int?
    var transmisionRelation1: Int?
    var transmisionRelation2: Int?
    var transmisionRelation3: Int?
    var transmisionRelation4: Int?
    var transmisionRelation5: Int?
    var transmisionRelation6: Int?
    var cyclePartChasis: Int?
    var cyclePartFrontSuspensionType: Int?
    var cyclePartFrontSuspensionBarDiameter: Int?
    var cyclePartFrontSuspensionPath: Int?
    var cyclePartRearSuspensionRocker: Int?
    var cyclePartRearSuspensionType: Int?
    var cyclePartRearSuspensionPath: Int?
    var cyclePartRearSuspensionRegulations: Int?
    var cyclePartRearSuspensionAbs: Int?
    var cyclePartFrontBrakeSystem: Int?
    var cyclePartFrontBrakeNumber: Int?
    var cyclePartFrontBrakeDiscDiameter: Int?
    var cyclePartFrontBrakeAncoragePin: Int?
    var cyclePartFrontBrakePinBrake: Int?
    var cyclePartRearBrakeSystem: Int?
    var cyclePartRearBrakeNumber: Int?
    var cyclePartRearBrakeDiscDiameter: Int?
    var cyclePartRearBrakePinBrake: Int?
    var cyclePartFrontWheelTireDiameter: Int?
    var cyclePartFrontWheelTireThroat: Int?
    var cyclePartFrontWheelTireMaterial: Int?
    var cyclePartFrontWheelPneumaticType: Int?
    var cyclePartFrontWheelPneumaticBrand: Int?
    var cyclePartFrontWheelPneumaticModel: Int?
    var cyclePartFrontWheelWidth: Int?
    var cyclePartFrontWheelHeight: Int?
    var cyclePartFrontWheelDiameter: Int?
    var cyclePartFrontWheelWeight: Int?
    var cyclePartFrontWheelSpeed: Int?
    var cyclePartFrontWheelPneumaticPressure: Int?
    var cyclePartFrontWheelPneumaticNumber: Int?
    var cyclePartRearWheelTireDiameter: Int?
    var cyclePartRearWheelTireThroat: Int?
    var cyclePartRearWheelTireMaterial: Int?
    var cyclePartRearWheelPneumaticType: Int?
    var cyclePartRearWheelPneumaticBrand: Int?
    var cyclePartRearWheelPneumaticModel: Int?
    var cyclePartRearWheelWidth: Int?
    var cyclePartRearWheelHeight: Int?
    var cyclePartRearWheelDiameter: Int?
    var cyclePartRearWheelWeight: Int?
    var cyclePartRearWheelSpeed: Int?
    var cyclePartRearWheelPneumaticPressure: Int?
    var cyclePartRearWheelPneumaticNumber: Int?
    var maintenanceMotorOilType: Int?
    var maintenanceMotorOilChangeKm: Int?
    var maintenanceMotorOilChangeDays: Int?
    var maintenanceMotorOilCapacity: Int?
    var maintenanceMotorOilFilterChangeKm: Int?
    var maintenanceMotorOilFilterChangeDays: Int?
    var maintenanceTransmitionOilType: Int?
    var maintenanceTransmitionOilChangeKm: Int?
    var maintenanceTransmitionOilChangeDays: Int?
    var maintenanceTransmitionOilCapacity: Int?
    var maintenanceRearWheelOilType: Int?
    var maintenanceRearWheelOilChangeKm: Int?
    var maintenanceRearWheelOilChangeDays: Int?
    var maintenanceRefrigerantType: Int?
    var maintenanceRefrigerantChangeKm: Int?
    var maintenanceRefrigerantChangeDays: Int?
    var maintenanceRefrigerantCapacity: Int?
    var maintenanceGearLiquidType: Int?
    var maintenanceGearLiquidChangeKm: Int?
    var maintenanceGearLiquidChangeDays: Int?
    var maintenanceGearClutchShoeChangeKm: Int?
    var maintenanceGearClutchShoeChangeDays: Int?
    var maintenanceBrakeLiquidType: Int?
    var maintenanceBrakeLiquidChangeKm: Int?
    var maintenanceBrakeLiquidChangeDays: Int?
    var maintenanceBrakeLiquidAbs: Int?
    var maintenanceBrakeSleeveChangeKm: Int?
    var maintenanceBrakeSleeveChangeDays: Int?
    var maintenanceAirFilterChangeKm: Int?
    var maintenanceAirFilterChangeDays: Int?
    var maintenanceSparkPlugChangeKm: Int?
    var maintenanceSparkPlugChangeDays: Int?
    var maintenanceBeltChangeKm: Int?
    var maintenanceBeltChangeDays: Int?
    var maintenanceLightBulbRoad: Int?
    var maintenanceFrontCrossoverLightBulb: Int?
    var maintenanceFrontPositionLightBulb: Int?
    var maintenanceRearPositionLightBulb: Int?
    var maintenanceRearBrakeLightBulb: Int?
    var maintenanceFrontBlinkersLightBulb: Int?
    var maintenanceRearBlinkersLightBulb: Int?
    var maintenancePlateLightBulb: Int?
    var dimensionsMaxLength: Int?
    var dimensionsMaxWidth: Int?
    var dimensionsMaxHeight: Int?
    var dimensionsAxisSeparation: Int?
    var dimensionsAxisSeatHeight: Int?
    var dimensionsAdvance: Int?
    var dimensionsLaunchAngle: Int?
    var dimensionsDirectionAngle: Int?
    var dimensionsDeclaredWeight: Int?
    var dimensionsTankCapacity: Int?
    var featuresSpeed: Int?
    var featuresConsumption: Int?
    var featuresAutonomy: Int?
    var featuresChargeTime: Int?
    var equipmentHoleUnderSeat: Int?
    var equipmentRevCounter: Int?
    var equipmentAnalogClock: Int?
    var equipmentOnboardComputer: Int?
    var equipmentGasLevel: Int?
    var equipmentCoolingTemp: Int?
    var equipmentAmbientTemp: Int?
    var equipmentGearIndicator: Int?
    var equipmentReservationLight: Int?
    var equipmentWarning: Int?
    var equipmentCentralEasel: Int?
    var equipmentKickstand: Int?
    var equipmentTractionControl: Int?
    var equipmentAbs: Int?
    var equipmentConsumption: Int?
    var createdAt: String?
    var updatedAt: String?
    var deletedAt: String?
    var motoModel: MotoModel?
    
    enum CodingKeys: String, CodingKey {
        case id
        case motoModelId = "moto_model_id"
        case motoCategoryId = "moto_category_id"
        case validated
        case generalName = "general__name"
        case generalType = "general__type"
        case generalLicenseType = "general__license_type"
        case generalSeats = "general__seats"
        case generalYearStart = "general__year_start"
        case generalYearEnd = "general__year_end"
        case generalUserManual = "general__user_manual"
        case generalMaintenanceManual = "general__maintenance_manual"
        case generalMakerName = "general__maker_name"
        case generalMakerWeb = "general__maker_web"
        case generalMakerImporter = "general__maker_importer"
        case generalMakerImporterWeb = "general__maker_importer_web"
        case motorCC = "motor__cc"
        case motorKW = "motor__kw"
        case motorCycle = "motor__cycle"
        case motorDisposition = "motor__disposition"
        case motorDistribution = "motor__distribution"
        case motorTraction = "motor__traction"
        case motorCylinders = "motor__cylinders"
        case motorValves = "motor__valves"
        case motorFeeding = "motor__feeding"
        case motorRefrigeration = "motor__refrigeration"
        case motorDiameterPerRace = "motor__diameter_per_race"
        case motorCompression = "motor__compression"
        case motorMaxPower = "motor__max_power"
        case motorDeclaredMaxPair = "motor__declared_max_pair"
        case motorGas = "motor__gas"
        case motorAntipollutionRegulation = "motor__antipollution_regulation"
        case motorLimitation = "motor__limitation"
        case motorAirFilterMaterial = "motor__air_filter_material"
        case ignitionIgnition = "ignition__ignition"
        case ignitionBattery = "ignition__battery"
        case transmisionGear = "transmision__gear"
        case transmisionSecondaryTransmition = "transmision__secondary_transmition"
        case transmisionTransmitionSwitch = "transmision__transmition_switch"
        case transmisionGearNum = "transmision__gear_num"
        case transmisionPrimaryRelation = "transmision__primary_relation"
        case transmisionFinalRelation = "transmision__final_relation"
        case transmisionRelation1 = "transmision__relation_1"
        case transmisionRelation2 = "transmision__relation_2"
        case transmisionRelation3 = "transmision__relation_3"
        case transmisionRelation4 = "transmision__relation_4"
        case transmisionRelation5 = "transmision__relation_5"
        case transmisionRelation6 = "transmision__relation_6"
        case cyclePartChasis = "cycle_part__chasis"
        case cyclePartFrontSuspensionType = "cycle_part__front_suspension_type"
        case cyclePartFrontSuspensionBarDiameter = "cycle_part__front_suspension_bar_diameter"
        case cyclePartFrontSuspensionPath = "cycle_part__front_suspension_path"
        case cyclePartRearSuspensionRocker = "cycle_part__rear_suspension_rocker"
        case cyclePartRearSuspensionType = "cycle_part__rear_suspension_type"
        case cyclePartRearSuspensionPath = "cycle_part__rear_suspension_path"
        case cyclePartRearSuspensionRegulations = "cycle_part__rear_suspension_regulations"
        case cyclePartRearSuspensionAbs = "cycle_part__rear_suspension_abs"
        case cyclePartFrontBrakeSystem = "cycle_part__front_brake_system"
        case cyclePartFrontBrakeNumber = "cycle_part__front_brake_number"
        case cyclePartFrontBrakeDiscDiameter = "cycle_part__front_brake_disc_diameter"
        case cyclePartFrontBrakeAncoragePin = "cycle_part__front_brake_ancorage_pin"
        case cyclePartFrontBrakePinBrake = "cycle_part__front_brake_pin_brake"
        case cyclePartRearBrakeSystem = "cycle_part__rear_brake_system"
        case cyclePartRearBrakeNumber = "cycle_part__rear_brake_number"
        case cyclePartRearBrakeDiscDiameter = "cycle_part__rear_brake_disc_diameter"
        case cyclePartRearBrakePinBrake = "cycle_part__rear_brake_pin_brake"
        case cyclePartFrontWheelTireDiameter = "cycle_part__front_wheel_tire_diameter"
        case cyclePartFrontWheelTireThroat = "cycle_part__front_wheel_tire_throat"
        case cyclePartFrontWheelTireMaterial = "cycle_part__front_wheel_tire_material"
        case cyclePartFrontWheelPneumaticType = "cycle_part__front_wheel_pneumatic_type"
        case cyclePartFrontWheelPneumaticBrand = "cycle_part__front_wheel_pneumatic_brand"
        case cyclePartFrontWheelPneumaticModel = "cycle_part__front_wheel_pneumatic_model"
        case cyclePartFrontWheelWidth = "cycle_part__front_wheel_width"
        case cyclePartFrontWheelHeight = "cycle_part__front_wheel_height"
        case cyclePartFrontWheelDiameter = "cycle_part__front_wheel_diameter"
        case cyclePartFrontWheelWeight = "cycle_part__front_wheel_weight"
        case cyclePartFrontWheelSpeed = "cycle_part__front_wheel_speed"
        case cyclePartFrontWheelPneumaticPressure = "cycle_part__front_wheel_pneumatic_pressure"
        case cyclePartFrontWheelPneumaticNumber = "cycle_part__front_wheel_pneumatic_number"
        case cyclePartRearWheelTireDiameter = "cycle_part__rear_wheel_tire_diameter"
        case cyclePartRearWheelTireThroat = "cycle_part__rear_wheel_tire_throat"
        case cyclePartRearWheelTireMaterial = "cycle_part__rear_wheel_tire_material"
        case cyclePartRearWheelPneumaticType = "cycle_part__rear_wheel_pneumatic_type"
        case cyclePartRearWheelPneumaticBrand = "cycle_part__rear_wheel_pneumatic_brand"
        case cyclePartRearWheelPneumaticModel = "cycle_part__rear_wheel_pneumatic_model"
        case cyclePartRearWheelWidth = "cycle_part__rear_wheel_width"
        case cyclePartRearWheelHeight = "cycle_part__rear_wheel_height"
        case cyclePartRearWheelDiameter = "cycle_part__rear_wheel_diameter"
        case cyclePartRearWheelWeight = "cycle_part__rear_wheel_weight"
        case cyclePartRearWheelSpeed = "cycle_part__rear_wheel_speed"
        case cyclePartRearWheelPneumaticPressure = "cycle_part__rear_wheel_pneumatic_pressure"
        case cyclePartRearWheelPneumaticNumber = "cycle_part__rear_wheel_pneumatic_number"
        case maintenanceMotorOilType = "maintenance__motor_oil_type"
        case maintenanceMotorOilChangeKm = "maintenance__motor_oil_change_km"
        case maintenanceMotorOilChangeDays = "maintenance__motor_oil_change_days"
        case maintenanceMotorOilCapacity = "maintenance__motor_oil_capacity"
        case maintenanceMotorOilFilterChangeKm = "maintenance__motor_oil_filter_change_km"
        case maintenanceMotorOilFilterChangeDays = "maintenance__motor_oil_filter_change_days"
        case maintenanceTransmitionOilType = "maintenance__transmition_oil_type"
        case maintenanceTransmitionOilChangeKm = "maintenance__transmition_oil_change_km"
        case maintenanceTransmitionOilChangeDays = "maintenance__transmition_oil_change_days"
        case maintenanceTransmitionOilCapacity = "maintenance__transmition_oil_capacity"
        case maintenanceRearWheelOilType = "maintenance__rear_wheel_oil_type"
        case maintenanceRearWheelOilChangeKm = "maintenance__rear_wheel_oil_change_km"
        case maintenanceRearWheelOilChangeDays = "maintenance__rear_wheel_oil_change_days"
        case maintenanceRefrigerantType = "maintenance__refrigerant_type"
        case maintenanceRefrigerantChangeKm = "maintenance__refrigerant_change_km"
        case maintenanceRefrigerantChangeDays = "maintenance__refrigerant_change_days"
        case maintenanceRefrigerantCapacity = "maintenance__refrigerant_capacity"
        case maintenanceGearLiquidType = "maintenance__gear_liquid_type"
        case maintenanceGearLiquidChangeKm = "maintenance__gear_liquid_change_km"
        case maintenanceGearLiquidChangeDays = "maintenance__gear_liquid_change_days"
        case maintenanceGearClutchShoeChangeKm = "maintenance__gear_clutch_shoe_change_km"
        case maintenanceGearClutchShoeChangeDays = "maintenance__gear_clutch_shoe_change_days"
        case maintenanceBrakeLiquidType = "maintenance__brake_liquid_type"
        case maintenanceBrakeLiquidChangeKm = "maintenance__brake_liquid_change_km"
        case maintenanceBrakeLiquidChangeDays = "maintenance__brake_liquid_change_days"
        case maintenanceBrakeLiquidAbs = "maintenance__brake_liquid_abs"
        case maintenanceBrakeSleeveChangeKm = "maintenance__brake_sleeve_change_km"
        case maintenanceBrakeSleeveChangeDays = "maintenance__brake_sleeve_change_days"
        case maintenanceAirFilterChangeKm = "maintenance__air_filter_change_km"
        case maintenanceAirFilterChangeDays = "maintenance__air_filter_change_days"
        case maintenanceSparkPlugChangeKm = "maintenance__spark_plug_change_km"
        case maintenanceSparkPlugChangeDays = "maintenance__spark_plug_change_days"
        case maintenanceBeltChangeKm = "maintenance__belt_change_km"
        case maintenanceBeltChangeDays = "maintenance__belt_change_days"
        case maintenanceLightBulbRoad = "maintenance__light_bulb_road"
        case maintenanceFrontCrossoverLightBulb = "maintenance__front_crossover_light_bulb"
        case maintenanceFrontPositionLightBulb = "maintenance__front_position_light_bulb"
        case maintenanceRearPositionLightBulb = "maintenance__rear_position_light_bulb"
        case maintenanceRearBrakeLightBulb = "maintenance__rear_brake_light_bulb"
        case maintenanceFrontBlinkersLightBulb = "maintenance__front_blinkers_light_bulb"
        case maintenanceRearBlinkersLightBulb = "maintenance__rear_blinkers_light_bulb"
        case maintenancePlateLightBulb = "maintenance__plate_light_bulb"
        case dimensionsMaxLength = "dimensions__max_length"
        case dimensionsMaxWidth = "dimensions__max_width"
        case dimensionsMaxHeight = "dimensions__max_height"
        case dimensionsAxisSeparation = "dimensions__axis_separation"
        case dimensionsAxisSeatHeight = "dimensions__axis_seat_height"
        case dimensionsAdvance = "dimensions__advance"
        case dimensionsLaunchAngle = "dimensions__launch_angle"
        case dimensionsDirectionAngle = "dimensions__direction_angle"
        case dimensionsDeclaredWeight = "dimensions__declared_weight"
        case dimensionsTankCapacity = "dimensions__tank_capacity"
        case featuresSpeed = "features__speed"
        case featuresConsumption = "features__consumption"
        case featuresAutonomy = "features__autonomy"
        case featuresChargeTime = "features__charge_time"
        case equipmentHoleUnderSeat = "equipment__hole_under_seat"
        case equipmentRevCounter = "equipment__rev_counter"
        case equipmentAnalogClock = "equipment__analog_clock"
        case equipmentOnboardComputer = "equipment__onboard_computer"
        case equipmentGasLevel = "equipment__gas_level"
        case equipmentCoolingTemp = "equipment__cooling_temp"
        case equipmentAmbientTemp = "equipment__ambient_temp"
        case equipmentGearIndicator = "equipment__gear_indicator"
        case equipmentReservationLight = "equipment__reservation_light"
        case equipmentWarning = "equipment__warning"
        case equipmentCentralEasel = "equipment__central_easel"
        case equipmentKickstand = "equipment__kickstand"
        case equipmentTractionControl = "equipment__traction_control"
        case equipmentAbs = "equipment__abs"
        case equipmentConsumption = "equipment__consumption"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case deletedAt = "deleted_at"
        case motoModel = "moto_model"
    }
}
