config DRV_TMR_INSTANCES_NUMBER_GT_${INSTANCE+1}
    bool
    depends on USE_DRV_TMR
<#if INSTANCE != 0>
    default n if DRV_TMR_INSTANCES_NUMBER_GT_${INSTANCE} = n     
</#if>  
    default n if DRV_TMR_INSTANCES_NUMBER = ${INSTANCE+1}
    default y
    
config DRV_TMR_INST_${INSTANCE}
    depends on USE_DRV_TMR 
<#if INSTANCE != 0>
                 && DRV_TMR_INSTANCES_NUMBER_GT_${INSTANCE}
</#if>
    bool "TMR Driver Instance ${INSTANCE}"
    default y
    ---help---
    IDH_HTML_DRV_TMR_INSTANCES_NUMBER
    ---endhelp---

ifblock DRV_TMR_INST_${INSTANCE}

	config DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE}
		string "Timer Module ID"
		depends on USE_DRV_TMR
		range TMR_MODULE_ID
		default "TMR_ID_1"
		set SYS_CLK_PMC_ID_TC0_CHANNEL0 optionally to y if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE}="TMR_ID_1"
		set SYS_CLK_PMC_ID_TC0_CHANNEL1 optionally to y if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE}="TMR_ID_2"
		set SYS_CLK_PMC_ID_TC0_CHANNEL2 optionally to y if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE}="TMR_ID_3"
		set SYS_CLK_PMC_ID_TC1_CHANNEL0 optionally to y if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE}="TMR_ID_4"
		set SYS_CLK_PMC_ID_TC1_CHANNEL1 optionally to y if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE}="TMR_ID_5"
		set SYS_CLK_PMC_ID_TC1_CHANNEL2 optionally to y if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE}="TMR_ID_6"
		set SYS_CLK_PMC_ID_TC2_CHANNEL0 optionally to y if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE}="TMR_ID_7"
		set SYS_CLK_PMC_ID_TC2_CHANNEL1 optionally to y if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE}="TMR_ID_8"
		set SYS_CLK_PMC_ID_TC2_CHANNEL2 optionally to y if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE}="TMR_ID_9"
		set SYS_CLK_PMC_ID_TC3_CHANNEL0 optionally to y if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE}="TMR_ID_10"
		set SYS_CLK_PMC_ID_TC3_CHANNEL1 optionally to y if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE}="TMR_ID_11"
		set SYS_CLK_PMC_ID_TC3_CHANNEL2 optionally to y if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE}="TMR_ID_12"
	
		---help---
		IDH_HTML_TMR_MODULE_ID
		---endhelp---
	config DRV_TMR_OPERATION_MODE_IDX${INSTANCE}
    string "Operation Mode"
    depends on USE_DRV_TMR
#    depends on DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} != "TMR_ID_2" &&
#        DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} != "TMR_ID_3" &&
#        DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} != "TMR_ID_5" &&
#        DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} != "TMR_ID_6" &&
#        DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} != "TMR_ID_8" &&
#        DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} != "TMR_ID_9" &&
#        DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} != "TMR_ID_11" &&		
#        DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} != "TMR_ID_12"

    range DRV_TMR_OPERATION_MODE
    default "DRV_TMR_OPERATION_MODE_16_BIT" persistent
    ---help---
    IDH_HTML_DRV_TMR_OPERATION_MODE
    ---endhelp---
	
		
	menu "RTOS Configuration (Instance ${INSTANCE})"
		depends on USE_DRV_TMR
		depends on USE_3RDPARTY_RTOS
		depends on DRV_TMR_DRIVER_MODE = "DYNAMIC"

	config DRV_TMR_RTOS_IDX${INSTANCE}
		string "Run This Driver Instance As"
		depends on DRV_TMR_DRIVER_MODE = "DYNAMIC"
		range 3RDPARTY_RTOS_SYS_TASKS_OPTIONS
		default "Combined with System Tasks"

	config DRV_TMR_IDX${INSTANCE}_RTOS_TASK_SIZE
		int "Task Size"
		depends on DRV_TMR_RTOS_IDX${INSTANCE} = "Standalone"
		default 1024

	config DRV_TMR_IDX${INSTANCE}_RTOS_TASK_PRIORITY
		int "Task Priority"
		depends on DRV_TMR_RTOS_IDX${INSTANCE} = "Standalone"
		default 1

	config DRV_TMR_IDX${INSTANCE}_RTOS_USE_DELAY
		bool "Use Task Delay?"
		depends on DRV_TMR_RTOS_IDX${INSTANCE} = "Standalone"
		default y

	config DRV_TMR_IDX${INSTANCE}_RTOS_DELAY
		int "Task Delay"
		depends on DRV_TMR_RTOS_IDX${INSTANCE} = "Standalone"
		depends on DRV_TMR_IDX${INSTANCE}_RTOS_USE_DELAY
		default 1000
	endmenu

	config DRV_TMR_INTERRUPT_SOURCE_IDX${INSTANCE}
		string
		depends on USE_DRV_TMR
		default "TC0_CH0_IRQn" if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_1"
		default "TC0_CH1_IRQn" if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_2"
		default "TC0_CH2_IRQn" if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_3"
		default "TC1_CH0_IRQn" if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_4"
		default "TC1_CH1_IRQn" if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_5"
		default "TC1_CH2_IRQn" if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_6"
		default "TC2_CH0_IRQn" if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_7"
		default "TC2_CH1_IRQn" if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_8"
		default "TC2_CH2_IRQn" if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_9"
		default "TC3_CH0_IRQn" if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_10"
		default "TC3_CH1_IRQn" if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_11"
		default "TC3_CH2_IRQn" if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_12"


		---help---
		IDH_HTML_INT_SOURCE
		---endhelp---

	config DRV_TMR_INTERRUPT_VECTOR_IDX${INSTANCE}
		string
		default "TC0_CH0_IRQn" if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_1"
		default "TC0_CH1_IRQn" if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_2"
		default "TC0_CH2_IRQn" if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_3"
		default "TC1_CH0_IRQn" if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_4"
		default "TC1_CH1_IRQn" if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_5"
		default "TC1_CH2_IRQn" if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_6"
		default "TC2_CH0_IRQn" if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_7"
		default "TC2_CH1_IRQn" if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_8"
		default "TC2_CH2_IRQn" if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_9"
		default "TC3_CH0_IRQn" if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_10"
		default "TC3_CH1_IRQn" if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_11"
		default "TC3_CH2_IRQn" if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_12"
		---help---
		IDH_HTML_INT_VECTOR
		---endhelp---

	config DRV_TMR_INTERRUPT_PRIORITY_IDX${INSTANCE}
		string "Interrupt Priority"
		depends on USE_DRV_TMR && DRV_TMR_INTERRUPT_MODE
		range INT_PRIORITY_LEVEL_PIC32C
		default "INT_PRIORITY_LEVEL1"
		---help---
		IDH_HTML_INT_PRIORITY_LEVEL
		---endhelp---

	config DRV_TMR_INT_PRIO_NUM_IDX${INSTANCE}
		string
		depends on USE_DRV_TMR && DRV_TMR_INTERRUPT_MODE
		default "0" if DRV_TMR_INTERRUPT_PRIORITY_IDX${INSTANCE} = "INT_DISABLE_INTERRUPT"
		default "1" if DRV_TMR_INTERRUPT_PRIORITY_IDX${INSTANCE} = "INT_PRIORITY_LEVEL1"
		default "2" if DRV_TMR_INTERRUPT_PRIORITY_IDX${INSTANCE} = "INT_PRIORITY_LEVEL2"
		default "3" if DRV_TMR_INTERRUPT_PRIORITY_IDX${INSTANCE} = "INT_PRIORITY_LEVEL3"
		default "4" if DRV_TMR_INTERRUPT_PRIORITY_IDX${INSTANCE} = "INT_PRIORITY_LEVEL4"
		default "5" if DRV_TMR_INTERRUPT_PRIORITY_IDX${INSTANCE} = "INT_PRIORITY_LEVEL5"
		default "6" if DRV_TMR_INTERRUPT_PRIORITY_IDX${INSTANCE} = "INT_PRIORITY_LEVEL6"
		default "7" if DRV_TMR_INTERRUPT_PRIORITY_IDX${INSTANCE} = "INT_PRIORITY_LEVEL7"

	config DRV_TMR_ISR_VECTOR_IDX${INSTANCE}
		string
		default "TC0_CH0_Handler" if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_1"
		default "TC0_CH1_Handler" if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_2"
		default "TC0_CH2_Handler" if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_3"
		default "TC1_CH0_Handler" if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_4"
		default "TC1_CH1_Handler" if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_5"
		default "TC1_CH2_Handler" if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_6"
		default "TC2_CH0_Handler" if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_7"
		default "TC2_CH1_Handler" if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_8"
		default "TC2_CH2_Handler" if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_9"
		default "TC3_CH0_Handler" if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_10"
		default "TC3_CH1_Handler" if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_11"
		default "TC3_CH2_Handler" if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_12"
	
	config DRV_TMR_MODULE_IDX${INSTANCE}
		string
		default 0 if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_1"
		default 0 if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_2"
		default 0 if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_3"
		default 1 if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_4"
		default 1 if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_5"
		default 1 if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_6"
		default 2 if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_7"
		default 2 if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_8"
		default 2 if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_9"
		default 3 if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_10"
		default 3 if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_11"
		default 3 if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_12"
	
	config DRV_TMR_CHANNEL_IDX${INSTANCE}
		string
		default 0 if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_1"
		default 1 if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_2"
		default 2 if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_3"
		default 0 if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_4"
		default 1 if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_5"
		default 2 if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_6"
		default 0 if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_7"
		default 1 if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_8"
		default 2 if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_9"
		default 0 if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_10"
		default 1 if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_11"
		default 2 if DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_12"

	config DRV_TMR_CLOCK_SOURCE_IDX${INSTANCE}
		string "Clock Source"
		depends on USE_DRV_TMR
		range TMR_SOURCE_CLOCK
		default "DRV_TMR_CLKSOURCE_MCK_PRESCALE_128" 

	ifblock DRV_TMR_DRIVER_MODE = "STATIC"
		config DRV_TMR_GATED_MODE_IDX${INSTANCE}
		bool "Gated Mode"
		depends on USE_DRV_TMR
		depends on DRV_TMR_CLOCK_SOURCE_IDX${INSTANCE} = "DRV_TMR_CLKSOURCE_XC0" || "DRV_TMR_CLKSOURCE_XC1" || "DRV_TMR_CLKSOURCE_XC2"
		default n
    
		config DRV_TMR_ALARM_FUNCS_IDX${INSTANCE}
			bool "Alarm Functions (Callbacks)"
			depends on USE_DRV_TMR
			default n
	endif
        
	ifblock DRV_TMR_DRIVER_MODE = "DYNAMIC"
		config DRV_TMR_ASYNC_WRITE_ENABLE_IDX${INSTANCE}
		bool
		depends on USE_DRV_TMR
		default n
		---help---
		IDH_HTML_DRV_TMR_ASYNC_WRITE_ENABLE
		---endhelp---


	config DRV_TMR_POWER_STATE_IDX${INSTANCE}
		depends on USE_DRV_TMR
		string "Power State"
		range SYS_MODULE_POWER_STATE
		default "SYS_MODULE_POWER_RUN_FULL"
		---help---
		IDH_HTML_SYSTEM_Library_Interface
		---endhelp---
	endif

	ifblock DRV_TMR_DRIVER_MODE = "STATIC"     
		config DRV_TMR_PERIOD_IDX${INSTANCE}
		int "Timer Period"
		depends on USE_DRV_TMR
		default 0
		---help---
		IDH_HTML_PLIB_TMR_Period16BitSet_TMR_MODULE_ID_uint16_t
		---endhelp---
	endif
	ifblock DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_1" && DRV_TMR_OPERATION_MODE_IDX${INSTANCE} = "DRV_TMR_OPERATION_MODE_32_BIT"
		config DRV_TMR_LSB_TMRX${INSTANCE} persistent
		string "LSB_TIMER" 
		depends on USE_DRV_TMR
		range TMR_MODULE_ID
		default "TMR_ID_2"
		set SYS_CLK_PMC_ID_TC0_CHANNEL1 optionally to y if DRV_TMR_LSB_TMRX${INSTANCE} = "TMR_ID_2"
	endif
	
	ifblock DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_4" && DRV_TMR_OPERATION_MODE_IDX${INSTANCE} = "DRV_TMR_OPERATION_MODE_32_BIT"
		config DRV_TMR_LSB_TMRY${INSTANCE}  persistent
		string "LSB_TIMER" 
		depends on USE_DRV_TMR
		range TMR_MODULE_ID
		default "TMR_ID_5"
		set SYS_CLK_PMC_ID_TC1_CHANNEL1 optionally to y if DRV_TMR_LSB_TMRY${INSTANCE} = "TMR_ID_5"
	endif
	
		ifblock DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_7" && DRV_TMR_OPERATION_MODE_IDX${INSTANCE} = "DRV_TMR_OPERATION_MODE_32_BIT"
		config DRV_TMR_LSB_TMRZ${INSTANCE} persistent
		string "LSB_TIMER" 
		depends on USE_DRV_TMR
		range TMR_MODULE_ID
		default "TMR_ID_8"
		set SYS_CLK_PMC_ID_TC2_CHANNEL1 optionally to y if DRV_TMR_LSB_TMRZ${INSTANCE} = "TMR_ID_8"
	endif
	
	ifblock DRV_TMR_PERIPHERAL_ID_IDX${INSTANCE} = "TMR_ID_10" && DRV_TMR_OPERATION_MODE_IDX${INSTANCE} = "DRV_TMR_OPERATION_MODE_32_BIT"
		config DRV_TMR_LSB_TMRI${INSTANCE} persistent
		string "LSB_TIMER" 
		depends on USE_DRV_TMR
		range TMR_MODULE_ID
		default "TMR_ID_11"
		set SYS_CLK_PMC_ID_TC3_CHANNEL1 optionally to y if DRV_TMR_LSB_TMRI${INSTANCE} = "TMR_ID_11"
		
	endif
endif