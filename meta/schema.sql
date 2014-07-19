DROP TABLE IF EXISTS crashes;
CREATE TABLE crashes (
	crash_id INTEGER, 
	record_type INTEGER, 
	vehicle_id INTEGER, 
	participant_id INTEGER, 
	participant_display_seq INTEGER, 
	vehicle_coded_seq INTEGER, 
	participant_vehicle_seq INTEGER, 
	serial_ FLOAT, 
	city_section_id INTEGER, 
	urban_area_code INTEGER, 
	functional_class_code INTEGER, 
	nhs_flag INTEGER, 
	highway_number VARCHAR, 
	highway_suffix INTEGER, 
	roadway_number VARCHAR, 
	highway_component VARCHAR, 
	mileage_type VARCHAR, 
	connection_number VARCHAR, 
	linear_reference_system_lrs VARCHAR, 
	special_jurisdiction INTEGER, 
	jurisdiction_group INTEGER, 
	street_number FLOAT, 
	nearest_intersecting_street_number FLOAT, 
	intersection_sequence_number VARCHAR, 
	distance_from_intersection VARCHAR, 
	direction_from_intersection INTEGER, 
	milepoint VARCHAR, 
	posted_speed_limit VARCHAR, 
	road_character INTEGER, 
	off_roadway_flag INTEGER, 
	intersection_type VARCHAR, 
	intersection_related_flag INTEGER, 
	roundabout_flag INTEGER, 
	driveway_related_flag INTEGER, 
	number_of_lanes INTEGER, 
	number_of_turning_legs VARCHAR, 
	median_type VARCHAR, 
	impact_location FLOAT, 
	crash_type VARCHAR, 
	collision_type VARCHAR, 
	crash_severity INTEGER, 
	weather_condition INTEGER, 
	road_surface_condition INTEGER, 
	light_condition INTEGER, 
	traffic_control_device_tcd FLOAT, 
	tcd_functional_flag INTEGER, 
	investigating_agency INTEGER, 
	crash_level_event_1_code VARCHAR, 
	crash_level_event_2_code VARCHAR, 
	crash_level_event_3_code VARCHAR, 
	crash_level_cause_1_code VARCHAR, 
	crash_level_cause_2_code VARCHAR, 
	crash_level_cause_3_code VARCHAR, 
	school_zone_indicator VARCHAR, 
	work_zone_indicator VARCHAR, 
	alcoholinvolved_flag INTEGER, 
	drugs_involved_flag INTEGER, 
	speed_involved_flag INTEGER, 
	crash_level_hit__run_flag INTEGER, 
	population_range_code VARCHAR, 
	road_control INTEGER, 
	route_type VARCHAR, 
	route_number VARCHAR, 
	region_id VARCHAR, 
	district_id VARCHAR, 
	segment_marker_id VARCHAR, 
	segment_point_lrs_measure VARCHAR, 
	unlocatable_flag INTEGER, 
	total_vehicle INTEGER, 
	total_fatality INTEGER, 
	total_serious_injury_inja INTEGER, 
	total_moderate_injury_injb INTEGER, 
	total_minor_injury_injc INTEGER, 
	total_nonfatal_injury INTEGER, 
	total_uninjured_children_age_0004 INTEGER, 
	total_uninjured_persons INTEGER, 
	total_pedestrian INTEGER, 
	total_pedestrian_fatality INTEGER, 
	total_pedestrian_nonfatal_injury INTEGER, 
	total_pedalcyclist INTEGER, 
	total_pedalcyclist_fatality INTEGER, 
	total_pedalcyclist_nonfatal_injury INTEGER, 
	total_unknown_nonmotorist INTEGER, 
	total_unknown_nonmotorist_fatality INTEGER, 
	total_unknown_nonmotorist_injury INTEGER, 
	total_vehicle_occupant INTEGER, 
	total_persons_involved INTEGER, 
	total_quantity_of_persons_using_safety_equipment_ INTEGER, 
	total_quantity_of_persons_not_using_safety_equipment INTEGER, 
	total_quantity_of_persons_safety_equipment_use_unknown INTEGER, 
	vehicle_ownership_code VARCHAR, 
	vehicle_special_use_code VARCHAR, 
	vehicle_type_code VARCHAR, 
	emergency_use_flag VARCHAR, 
	number_of_trailers VARCHAR, 
	vehicle_movement_code VARCHAR, 
	vehicle_travel_direction_from VARCHAR, 
	vehicle_travel_direction_to VARCHAR, 
	vehicle_action_code VARCHAR, 
	vehicle_cause_1_code VARCHAR, 
	vehicle_cause_2_code VARCHAR, 
	vehicle_cause_3_code VARCHAR, 
	vehicle_event_1_code VARCHAR, 
	vehicle_event_2_code VARCHAR, 
	vehicle_event_3_code VARCHAR, 
	vehicle_exceeded_posted_speed_flag VARCHAR, 
	vehicle_hit__run_flag VARCHAR, 
	safety_equipment_used_quantity VARCHAR, 
	safety_equipment_unused_quantity VARCHAR, 
	safety_equipment_use_unknown_quantity VARCHAR, 
	vehicle_occupant VARCHAR, 
	vehicle_striking_flag VARCHAR, 
	participant_type_code VARCHAR, 
	participant_hit__run_flag VARCHAR, 
	public_employee_flag VARCHAR, 
	sex VARCHAR, 
	age VARCHAR, 
	driver_license_status VARCHAR, 
	driver_residence VARCHAR, 
	injury_severity VARCHAR, 
	participant_safety_equipment_use_code VARCHAR, 
	airbag_deployment VARCHAR, 
	nonmotorist_movement_code VARCHAR, 
	nonmotorist_travel_direction_from VARCHAR, 
	nonmotorist_travel_direction_to VARCHAR, 
	nonmotorist_location VARCHAR, 
	participant_action VARCHAR, 
	participant_error_1_code VARCHAR, 
	participant_error_2_code VARCHAR, 
	participant_error_3_code VARCHAR, 
	participant_cause_1_code VARCHAR, 
	participant_cause_2_code VARCHAR, 
	participant_cause_3_code VARCHAR, 
	participant_event_1_code VARCHAR, 
	participant_event_2_code VARCHAR, 
	participant_event_3_code VARCHAR, 
	bac_test_results_code VARCHAR, 
	alcohol_use_reported VARCHAR, 
	drug_use_reported VARCHAR, 
	participant_striker_flag VARCHAR, 
	lat FLOAT, 
	lon FLOAT, 
	date TIMESTAMP WITHOUT TIME ZONE
);
ALTER TABLE crashes ADD PRIMARY KEY (crash_id);
