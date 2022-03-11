# vulkan-ruby 1.3.207.1
#
#   => https://github.com/sinisterchipmunk/vulkan-ruby
#
# [NOTICE] This is an automatically generated file.

module Vulkan
  typealias 'HMONITOR', 'void *' unless send(:type_alias).key?('HMONITOR') # defined in windows.h
  typealias 'SECURITY_ATTRIBUTES', 'void *' unless send(:type_alias).key?('SECURITY_ATTRIBUTES') # defined in windows.h
  typealias 'IDirectFB', 'void *' unless send(:type_alias).key?('IDirectFB') # defined in directfb.h
  typealias 'IDirectFBSurface', 'void *' unless send(:type_alias).key?('IDirectFBSurface') # defined in directfb.h
  typealias 'GgpStreamDescriptor', 'void *' unless send(:type_alias).key?('GgpStreamDescriptor') # defined in ggp_c/vulkan_types.h
  typealias 'GgpFrameToken', 'void *' unless send(:type_alias).key?('GgpFrameToken') # defined in ggp_c/vulkan_types.h
  typealias '_screen_context', 'void *' unless send(:type_alias).key?('_screen_context') # defined in screen/screen.h
  typealias '_screen_window', 'void *' unless send(:type_alias).key?('_screen_window') # defined in screen/screen.h
  VK_DEFINE_HANDLE = 0 # dummy value, its real value could not be converted
  VK_USE_64_BIT_PTR_DEFINES = 0 # dummy value, its real value could not be converted
  VK_NULL_HANDLE = 0 # dummy value, its real value could not be converted
  VK_DEFINE_NON_DISPATCHABLE_HANDLE = 0 # dummy value, its real value could not be converted
  typealias 'ANativeWindow', 'void' unless send(:type_alias).key?('ANativeWindow')
  typealias 'AHardwareBuffer', 'void' unless send(:type_alias).key?('AHardwareBuffer')
  typealias 'CAMetalLayer', 'void' unless send(:type_alias).key?('CAMetalLayer')
  typealias 'VkSampleMask', 'uint32_t'
  typealias 'VkBool32', 'uint32_t'
  typealias 'VkFlags', 'uint32_t'
  typealias 'VkFlags64', 'uint64_t'
  typealias 'VkDeviceSize', 'uint64_t'
  typealias 'VkDeviceAddress', 'uint64_t'
  typealias 'VkFramebufferCreateFlags', 'VkFlags'
  typealias 'VkQueryPoolCreateFlags', 'VkFlags'
  typealias 'VkRenderPassCreateFlags', 'VkFlags'
  typealias 'VkSamplerCreateFlags', 'VkFlags'
  typealias 'VkPipelineLayoutCreateFlags', 'VkFlags'
  typealias 'VkPipelineCacheCreateFlags', 'VkFlags'
  typealias 'VkPipelineDepthStencilStateCreateFlags', 'VkFlags'
  typealias 'VkPipelineDynamicStateCreateFlags', 'VkFlags'
  typealias 'VkPipelineColorBlendStateCreateFlags', 'VkFlags'
  typealias 'VkPipelineMultisampleStateCreateFlags', 'VkFlags'
  typealias 'VkPipelineRasterizationStateCreateFlags', 'VkFlags'
  typealias 'VkPipelineViewportStateCreateFlags', 'VkFlags'
  typealias 'VkPipelineTessellationStateCreateFlags', 'VkFlags'
  typealias 'VkPipelineInputAssemblyStateCreateFlags', 'VkFlags'
  typealias 'VkPipelineVertexInputStateCreateFlags', 'VkFlags'
  typealias 'VkPipelineShaderStageCreateFlags', 'VkFlags'
  typealias 'VkDescriptorSetLayoutCreateFlags', 'VkFlags'
  typealias 'VkBufferViewCreateFlags', 'VkFlags'
  typealias 'VkInstanceCreateFlags', 'VkFlags'
  typealias 'VkDeviceCreateFlags', 'VkFlags'
  typealias 'VkDeviceQueueCreateFlags', 'VkFlags'
  typealias 'VkQueueFlags', 'VkFlags'
  typealias 'VkMemoryPropertyFlags', 'VkFlags'
  typealias 'VkMemoryHeapFlags', 'VkFlags'
  typealias 'VkAccessFlags', 'VkFlags'
  typealias 'VkBufferUsageFlags', 'VkFlags'
  typealias 'VkBufferCreateFlags', 'VkFlags'
  typealias 'VkShaderStageFlags', 'VkFlags'
  typealias 'VkImageUsageFlags', 'VkFlags'
  typealias 'VkImageCreateFlags', 'VkFlags'
  typealias 'VkImageViewCreateFlags', 'VkFlags'
  typealias 'VkPipelineCreateFlags', 'VkFlags'
  typealias 'VkColorComponentFlags', 'VkFlags'
  typealias 'VkFenceCreateFlags', 'VkFlags'
  typealias 'VkSemaphoreCreateFlags', 'VkFlags'
  typealias 'VkFormatFeatureFlags', 'VkFlags'
  typealias 'VkQueryControlFlags', 'VkFlags'
  typealias 'VkQueryResultFlags', 'VkFlags'
  typealias 'VkShaderModuleCreateFlags', 'VkFlags'
  typealias 'VkEventCreateFlags', 'VkFlags'
  typealias 'VkCommandPoolCreateFlags', 'VkFlags'
  typealias 'VkCommandPoolResetFlags', 'VkFlags'
  typealias 'VkCommandBufferResetFlags', 'VkFlags'
  typealias 'VkCommandBufferUsageFlags', 'VkFlags'
  typealias 'VkQueryPipelineStatisticFlags', 'VkFlags'
  typealias 'VkMemoryMapFlags', 'VkFlags'
  typealias 'VkImageAspectFlags', 'VkFlags'
  typealias 'VkSparseMemoryBindFlags', 'VkFlags'
  typealias 'VkSparseImageFormatFlags', 'VkFlags'
  typealias 'VkSubpassDescriptionFlags', 'VkFlags'
  typealias 'VkPipelineStageFlags', 'VkFlags'
  typealias 'VkSampleCountFlags', 'VkFlags'
  typealias 'VkAttachmentDescriptionFlags', 'VkFlags'
  typealias 'VkStencilFaceFlags', 'VkFlags'
  typealias 'VkCullModeFlags', 'VkFlags'
  typealias 'VkDescriptorPoolCreateFlags', 'VkFlags'
  typealias 'VkDescriptorPoolResetFlags', 'VkFlags'
  typealias 'VkDependencyFlags', 'VkFlags'
  typealias 'VkSubgroupFeatureFlags', 'VkFlags'
  typealias 'VkIndirectCommandsLayoutUsageFlagsNV', 'VkFlags'
  typealias 'VkIndirectStateFlagsNV', 'VkFlags'
  typealias 'VkGeometryFlagsKHR', 'VkFlags'
  typealias 'VkGeometryInstanceFlagsKHR', 'VkFlags'
  typealias 'VkBuildAccelerationStructureFlagsKHR', 'VkFlags'
  typealias 'VkPrivateDataSlotCreateFlags', 'VkFlags'
  typealias 'VkAccelerationStructureCreateFlagsKHR', 'VkFlags'
  typealias 'VkDescriptorUpdateTemplateCreateFlags', 'VkFlags'
  typealias 'VkPipelineCreationFeedbackFlags', 'VkFlags'
  typealias 'VkPerformanceCounterDescriptionFlagsKHR', 'VkFlags'
  typealias 'VkAcquireProfilingLockFlagsKHR', 'VkFlags'
  typealias 'VkSemaphoreWaitFlags', 'VkFlags'
  typealias 'VkPipelineCompilerControlFlagsAMD', 'VkFlags'
  typealias 'VkShaderCorePropertiesFlagsAMD', 'VkFlags'
  typealias 'VkDeviceDiagnosticsConfigFlagsNV', 'VkFlags'
  typealias 'VkAccessFlags2', 'VkFlags64'
  typealias 'VkPipelineStageFlags2', 'VkFlags64'
  typealias 'VkAccelerationStructureMotionInfoFlagsNV', 'VkFlags'
  typealias 'VkAccelerationStructureMotionInstanceFlagsNV', 'VkFlags'
  typealias 'VkFormatFeatureFlags2', 'VkFlags64'
  typealias 'VkRenderingFlags', 'VkFlags'
  typealias 'VkCompositeAlphaFlagsKHR', 'VkFlags'
  typealias 'VkDisplayPlaneAlphaFlagsKHR', 'VkFlags'
  typealias 'VkSurfaceTransformFlagsKHR', 'VkFlags'
  typealias 'VkSwapchainCreateFlagsKHR', 'VkFlags'
  typealias 'VkDisplayModeCreateFlagsKHR', 'VkFlags'
  typealias 'VkDisplaySurfaceCreateFlagsKHR', 'VkFlags'
  typealias 'VkAndroidSurfaceCreateFlagsKHR', 'VkFlags'
  typealias 'VkViSurfaceCreateFlagsNN', 'VkFlags'
  typealias 'VkWaylandSurfaceCreateFlagsKHR', 'VkFlags'
  typealias 'VkWin32SurfaceCreateFlagsKHR', 'VkFlags'
  typealias 'VkXlibSurfaceCreateFlagsKHR', 'VkFlags'
  typealias 'VkXcbSurfaceCreateFlagsKHR', 'VkFlags'
  typealias 'VkDirectFBSurfaceCreateFlagsEXT', 'VkFlags'
  typealias 'VkIOSSurfaceCreateFlagsMVK', 'VkFlags'
  typealias 'VkMacOSSurfaceCreateFlagsMVK', 'VkFlags'
  typealias 'VkMetalSurfaceCreateFlagsEXT', 'VkFlags'
  typealias 'VkImagePipeSurfaceCreateFlagsFUCHSIA', 'VkFlags'
  typealias 'VkStreamDescriptorSurfaceCreateFlagsGGP', 'VkFlags'
  typealias 'VkHeadlessSurfaceCreateFlagsEXT', 'VkFlags'
  typealias 'VkScreenSurfaceCreateFlagsQNX', 'VkFlags'
  typealias 'VkPeerMemoryFeatureFlags', 'VkFlags'
  typealias 'VkMemoryAllocateFlags', 'VkFlags'
  typealias 'VkDeviceGroupPresentModeFlagsKHR', 'VkFlags'
  typealias 'VkDebugReportFlagsEXT', 'VkFlags'
  typealias 'VkCommandPoolTrimFlags', 'VkFlags'
  typealias 'VkExternalMemoryHandleTypeFlagsNV', 'VkFlags'
  typealias 'VkExternalMemoryFeatureFlagsNV', 'VkFlags'
  typealias 'VkExternalMemoryHandleTypeFlags', 'VkFlags'
  typealias 'VkExternalMemoryFeatureFlags', 'VkFlags'
  typealias 'VkExternalSemaphoreHandleTypeFlags', 'VkFlags'
  typealias 'VkExternalSemaphoreFeatureFlags', 'VkFlags'
  typealias 'VkSemaphoreImportFlags', 'VkFlags'
  typealias 'VkExternalFenceHandleTypeFlags', 'VkFlags'
  typealias 'VkExternalFenceFeatureFlags', 'VkFlags'
  typealias 'VkFenceImportFlags', 'VkFlags'
  typealias 'VkSurfaceCounterFlagsEXT', 'VkFlags'
  typealias 'VkPipelineViewportSwizzleStateCreateFlagsNV', 'VkFlags'
  typealias 'VkPipelineDiscardRectangleStateCreateFlagsEXT', 'VkFlags'
  typealias 'VkPipelineCoverageToColorStateCreateFlagsNV', 'VkFlags'
  typealias 'VkPipelineCoverageModulationStateCreateFlagsNV', 'VkFlags'
  typealias 'VkPipelineCoverageReductionStateCreateFlagsNV', 'VkFlags'
  typealias 'VkValidationCacheCreateFlagsEXT', 'VkFlags'
  typealias 'VkDebugUtilsMessageSeverityFlagsEXT', 'VkFlags'
  typealias 'VkDebugUtilsMessageTypeFlagsEXT', 'VkFlags'
  typealias 'VkDebugUtilsMessengerCreateFlagsEXT', 'VkFlags'
  typealias 'VkDebugUtilsMessengerCallbackDataFlagsEXT', 'VkFlags'
  typealias 'VkDeviceMemoryReportFlagsEXT', 'VkFlags'
  typealias 'VkPipelineRasterizationConservativeStateCreateFlagsEXT', 'VkFlags'
  typealias 'VkDescriptorBindingFlags', 'VkFlags'
  typealias 'VkConditionalRenderingFlagsEXT', 'VkFlags'
  typealias 'VkResolveModeFlags', 'VkFlags'
  typealias 'VkPipelineRasterizationStateStreamCreateFlagsEXT', 'VkFlags'
  typealias 'VkPipelineRasterizationDepthClipStateCreateFlagsEXT', 'VkFlags'
  typealias 'VkSwapchainImageUsageFlagsANDROID', 'VkFlags'
  typealias 'VkToolPurposeFlags', 'VkFlags'
  typealias 'VkSubmitFlags', 'VkFlags'
  typealias 'VkImageFormatConstraintsFlagsFUCHSIA', 'VkFlags'
  typealias 'VkImageConstraintsInfoFlagsFUCHSIA', 'VkFlags'
  typealias 'VkVideoCodecOperationFlagsKHR', 'VkFlags'
  typealias 'VkVideoCapabilityFlagsKHR', 'VkFlags'
  typealias 'VkVideoSessionCreateFlagsKHR', 'VkFlags'
  typealias 'VkVideoBeginCodingFlagsKHR', 'VkFlags'
  typealias 'VkVideoEndCodingFlagsKHR', 'VkFlags'
  typealias 'VkVideoCodingQualityPresetFlagsKHR', 'VkFlags'
  typealias 'VkVideoCodingControlFlagsKHR', 'VkFlags'
  typealias 'VkVideoDecodeCapabilityFlagsKHR', 'VkFlags'
  typealias 'VkVideoDecodeFlagsKHR', 'VkFlags'
  typealias 'VkVideoDecodeH264PictureLayoutFlagsEXT', 'VkFlags'
  typealias 'VkVideoDecodeH264CreateFlagsEXT', 'VkFlags'
  typealias 'VkVideoDecodeH265CreateFlagsEXT', 'VkFlags'
  typealias 'VkVideoEncodeFlagsKHR', 'VkFlags'
  typealias 'VkVideoEncodeCapabilityFlagsKHR', 'VkFlags'
  typealias 'VkVideoEncodeRateControlFlagsKHR', 'VkFlags'
  typealias 'VkVideoEncodeRateControlModeFlagsKHR', 'VkFlags'
  typealias 'VkVideoChromaSubsamplingFlagsKHR', 'VkFlags'
  typealias 'VkVideoComponentBitDepthFlagsKHR', 'VkFlags'
  typealias 'VkVideoEncodeH264CapabilityFlagsEXT', 'VkFlags'
  typealias 'VkVideoEncodeH264InputModeFlagsEXT', 'VkFlags'
  typealias 'VkVideoEncodeH264OutputModeFlagsEXT', 'VkFlags'
  typealias 'VkVideoEncodeH264CreateFlagsEXT', 'VkFlags'
  typealias 'VkVideoEncodeH264RateControlStructureFlagsEXT', 'VkFlags'
  typealias 'VkVideoEncodeH265CapabilityFlagsEXT', 'VkFlags'
  typealias 'VkVideoEncodeH265InputModeFlagsEXT', 'VkFlags'
  typealias 'VkVideoEncodeH265OutputModeFlagsEXT', 'VkFlags'
  typealias 'VkVideoEncodeH265CreateFlagsEXT', 'VkFlags'
  typealias 'VkVideoEncodeH265RateControlStructureFlagsEXT', 'VkFlags'
  typealias 'VkVideoEncodeH265CtbSizeFlagsEXT', 'VkFlags'
  typealias 'VkVideoEncodeH265TransformBlockSizeFlagsEXT', 'VkFlags'
  typealias 'VkInstance', 'void *' # handle
  typealias 'VkPhysicalDevice', 'void *' # handle
  typealias 'VkDevice', 'void *' # handle
  typealias 'VkQueue', 'void *' # handle
  typealias 'VkCommandBuffer', 'void *' # handle
  typealias 'VkDeviceMemory', 'void *' # handle
  typealias 'VkCommandPool', 'void *' # handle
  typealias 'VkBuffer', 'void *' # handle
  typealias 'VkBufferView', 'void *' # handle
  typealias 'VkImage', 'void *' # handle
  typealias 'VkImageView', 'void *' # handle
  typealias 'VkShaderModule', 'void *' # handle
  typealias 'VkPipeline', 'void *' # handle
  typealias 'VkPipelineLayout', 'void *' # handle
  typealias 'VkSampler', 'void *' # handle
  typealias 'VkDescriptorSet', 'void *' # handle
  typealias 'VkDescriptorSetLayout', 'void *' # handle
  typealias 'VkDescriptorPool', 'void *' # handle
  typealias 'VkFence', 'void *' # handle
  typealias 'VkSemaphore', 'void *' # handle
  typealias 'VkEvent', 'void *' # handle
  typealias 'VkQueryPool', 'void *' # handle
  typealias 'VkFramebuffer', 'void *' # handle
  typealias 'VkRenderPass', 'void *' # handle
  typealias 'VkPipelineCache', 'void *' # handle
  typealias 'VkIndirectCommandsLayoutNV', 'void *' # handle
  typealias 'VkDescriptorUpdateTemplate', 'void *' # handle
  typealias 'VkDescriptorUpdateTemplateKHR', 'void *' # handle
  typealias 'VkSamplerYcbcrConversion', 'void *' # handle
  typealias 'VkSamplerYcbcrConversionKHR', 'void *' # handle
  typealias 'VkValidationCacheEXT', 'void *' # handle
  typealias 'VkAccelerationStructureKHR', 'void *' # handle
  typealias 'VkAccelerationStructureNV', 'void *' # handle
  typealias 'VkPerformanceConfigurationINTEL', 'void *' # handle
  typealias 'VkBufferCollectionFUCHSIA', 'void *' # handle
  typealias 'VkDeferredOperationKHR', 'void *' # handle
  typealias 'VkPrivateDataSlot', 'void *' # handle
  typealias 'VkPrivateDataSlotEXT', 'void *' # handle
  typealias 'VkCuModuleNVX', 'void *' # handle
  typealias 'VkCuFunctionNVX', 'void *' # handle
  typealias 'VkDisplayKHR', 'void *' # handle
  typealias 'VkDisplayModeKHR', 'void *' # handle
  typealias 'VkSurfaceKHR', 'void *' # handle
  typealias 'VkSwapchainKHR', 'void *' # handle
  typealias 'VkDebugReportCallbackEXT', 'void *' # handle
  typealias 'VkDebugUtilsMessengerEXT', 'void *' # handle
  typealias 'VkVideoSessionKHR', 'void *' # handle
  typealias 'VkVideoSessionParametersKHR', 'void *' # handle
  typealias 'VkAttachmentLoadOp', 'int' # enum
  typealias 'VkAttachmentStoreOp', 'int' # enum
  typealias 'VkBlendFactor', 'int' # enum
  typealias 'VkBlendOp', 'int' # enum
  typealias 'VkBorderColor', 'int' # enum
  typealias 'VkFramebufferCreateFlagBits', 'int' # enum
  typealias 'VkQueryPoolCreateFlagBits', 'int' # enum
  typealias 'VkRenderPassCreateFlagBits', 'int' # enum
  typealias 'VkSamplerCreateFlagBits', 'int' # enum
  typealias 'VkPipelineCacheHeaderVersion', 'int' # enum
  typealias 'VkPipelineCacheCreateFlagBits', 'int' # enum
  typealias 'VkPipelineShaderStageCreateFlagBits', 'int' # enum
  typealias 'VkDescriptorSetLayoutCreateFlagBits', 'int' # enum
  typealias 'VkInstanceCreateFlagBits', 'int' # enum
  typealias 'VkDeviceQueueCreateFlagBits', 'int' # enum
  typealias 'VkBufferCreateFlagBits', 'int' # enum
  typealias 'VkBufferUsageFlagBits', 'int' # enum
  typealias 'VkColorComponentFlagBits', 'int' # enum
  typealias 'VkComponentSwizzle', 'int' # enum
  typealias 'VkCommandPoolCreateFlagBits', 'int' # enum
  typealias 'VkCommandPoolResetFlagBits', 'int' # enum
  typealias 'VkCommandBufferResetFlagBits', 'int' # enum
  typealias 'VkCommandBufferLevel', 'int' # enum
  typealias 'VkCommandBufferUsageFlagBits', 'int' # enum
  typealias 'VkCompareOp', 'int' # enum
  typealias 'VkCullModeFlagBits', 'int' # enum
  typealias 'VkDescriptorType', 'int' # enum
  typealias 'VkDeviceCreateFlagBits', 'int' # enum
  typealias 'VkDynamicState', 'int' # enum
  typealias 'VkFenceCreateFlagBits', 'int' # enum
  typealias 'VkPolygonMode', 'int' # enum
  typealias 'VkFormat', 'int' # enum
  typealias 'VkFormatFeatureFlagBits', 'int' # enum
  typealias 'VkFrontFace', 'int' # enum
  typealias 'VkImageAspectFlagBits', 'int' # enum
  typealias 'VkImageCreateFlagBits', 'int' # enum
  typealias 'VkImageLayout', 'int' # enum
  typealias 'VkImageTiling', 'int' # enum
  typealias 'VkImageType', 'int' # enum
  typealias 'VkImageUsageFlagBits', 'int' # enum
  typealias 'VkImageViewCreateFlagBits', 'int' # enum
  typealias 'VkImageViewType', 'int' # enum
  typealias 'VkSharingMode', 'int' # enum
  typealias 'VkIndexType', 'int' # enum
  typealias 'VkLogicOp', 'int' # enum
  typealias 'VkMemoryHeapFlagBits', 'int' # enum
  typealias 'VkAccessFlagBits', 'int' # enum
  typealias 'VkMemoryPropertyFlagBits', 'int' # enum
  typealias 'VkPhysicalDeviceType', 'int' # enum
  typealias 'VkPipelineBindPoint', 'int' # enum
  typealias 'VkPipelineCreateFlagBits', 'int' # enum
  typealias 'VkPrimitiveTopology', 'int' # enum
  typealias 'VkQueryControlFlagBits', 'int' # enum
  typealias 'VkQueryPipelineStatisticFlagBits', 'int' # enum
  typealias 'VkQueryResultFlagBits', 'int' # enum
  typealias 'VkQueryType', 'int' # enum
  typealias 'VkQueueFlagBits', 'int' # enum
  typealias 'VkSubpassContents', 'int' # enum
  typealias 'VkResult', 'int' # enum
  typealias 'VkShaderStageFlagBits', 'int' # enum
  typealias 'VkSparseMemoryBindFlagBits', 'int' # enum
  typealias 'VkStencilFaceFlagBits', 'int' # enum
  typealias 'VkStencilOp', 'int' # enum
  typealias 'VkStructureType', 'int' # enum
  typealias 'VkSystemAllocationScope', 'int' # enum
  typealias 'VkInternalAllocationType', 'int' # enum
  typealias 'VkSamplerAddressMode', 'int' # enum
  typealias 'VkFilter', 'int' # enum
  typealias 'VkSamplerMipmapMode', 'int' # enum
  typealias 'VkVertexInputRate', 'int' # enum
  typealias 'VkPipelineStageFlagBits', 'int' # enum
  typealias 'VkSparseImageFormatFlagBits', 'int' # enum
  typealias 'VkSampleCountFlagBits', 'int' # enum
  typealias 'VkAttachmentDescriptionFlagBits', 'int' # enum
  typealias 'VkDescriptorPoolCreateFlagBits', 'int' # enum
  typealias 'VkDependencyFlagBits', 'int' # enum
  typealias 'VkObjectType', 'int' # enum
  typealias 'VkEventCreateFlagBits', 'int' # enum
  typealias 'VkPipelineLayoutCreateFlagBits', 'int' # enum
  typealias 'VkSemaphoreCreateFlagBits', 'int' # enum
  typealias 'VkIndirectCommandsLayoutUsageFlagBitsNV', 'int' # enum
  typealias 'VkIndirectCommandsTokenTypeNV', 'int' # enum
  typealias 'VkIndirectStateFlagBitsNV', 'int' # enum
  typealias 'VkPrivateDataSlotCreateFlagBits', 'int' # enum
  typealias 'VkPrivateDataSlotCreateFlagBitsEXT', 'int' # enum
  typealias 'VkDescriptorUpdateTemplateType', 'int' # enum
  typealias 'VkDescriptorUpdateTemplateTypeKHR', 'int' # enum
  typealias 'VkViewportCoordinateSwizzleNV', 'int' # enum
  typealias 'VkDiscardRectangleModeEXT', 'int' # enum
  typealias 'VkSubpassDescriptionFlagBits', 'int' # enum
  typealias 'VkPointClippingBehavior', 'int' # enum
  typealias 'VkPointClippingBehaviorKHR', 'int' # enum
  typealias 'VkCoverageModulationModeNV', 'int' # enum
  typealias 'VkCoverageReductionModeNV', 'int' # enum
  typealias 'VkValidationCacheHeaderVersionEXT', 'int' # enum
  typealias 'VkShaderInfoTypeAMD', 'int' # enum
  typealias 'VkQueueGlobalPriorityKHR', 'int' # enum
  typealias 'VkQueueGlobalPriorityEXT', 'int' # enum
  typealias 'VkTimeDomainEXT', 'int' # enum
  typealias 'VkConservativeRasterizationModeEXT', 'int' # enum
  typealias 'VkResolveModeFlagBits', 'int' # enum
  typealias 'VkResolveModeFlagBitsKHR', 'int' # enum
  typealias 'VkDescriptorBindingFlagBits', 'int' # enum
  typealias 'VkDescriptorBindingFlagBitsEXT', 'int' # enum
  typealias 'VkConditionalRenderingFlagBitsEXT', 'int' # enum
  typealias 'VkSemaphoreType', 'int' # enum
  typealias 'VkSemaphoreTypeKHR', 'int' # enum
  typealias 'VkGeometryFlagBitsKHR', 'int' # enum
  typealias 'VkGeometryFlagBitsNV', 'int' # enum
  typealias 'VkGeometryInstanceFlagBitsKHR', 'int' # enum
  typealias 'VkGeometryInstanceFlagBitsNV', 'int' # enum
  typealias 'VkBuildAccelerationStructureFlagBitsKHR', 'int' # enum
  typealias 'VkBuildAccelerationStructureFlagBitsNV', 'int' # enum
  typealias 'VkAccelerationStructureCreateFlagBitsKHR', 'int' # enum
  typealias 'VkBuildAccelerationStructureModeKHR', 'int' # enum
  typealias 'VkCopyAccelerationStructureModeKHR', 'int' # enum
  typealias 'VkCopyAccelerationStructureModeNV', 'int' # enum
  typealias 'VkAccelerationStructureTypeKHR', 'int' # enum
  typealias 'VkAccelerationStructureTypeNV', 'int' # enum
  typealias 'VkGeometryTypeKHR', 'int' # enum
  typealias 'VkGeometryTypeNV', 'int' # enum
  typealias 'VkRayTracingShaderGroupTypeKHR', 'int' # enum
  typealias 'VkRayTracingShaderGroupTypeNV', 'int' # enum
  typealias 'VkAccelerationStructureMemoryRequirementsTypeNV', 'int' # enum
  typealias 'VkAccelerationStructureBuildTypeKHR', 'int' # enum
  typealias 'VkAccelerationStructureCompatibilityKHR', 'int' # enum
  typealias 'VkShaderGroupShaderKHR', 'int' # enum
  typealias 'VkMemoryOverallocationBehaviorAMD', 'int' # enum
  typealias 'VkScopeNV', 'int' # enum
  typealias 'VkComponentTypeNV', 'int' # enum
  typealias 'VkDeviceDiagnosticsConfigFlagBitsNV', 'int' # enum
  typealias 'VkPipelineCreationFeedbackFlagBits', 'int' # enum
  typealias 'VkPipelineCreationFeedbackFlagBitsEXT', 'int' # enum
  typealias 'VkPerformanceCounterScopeKHR', 'int' # enum
  typealias 'VkPerformanceCounterUnitKHR', 'int' # enum
  typealias 'VkPerformanceCounterStorageKHR', 'int' # enum
  typealias 'VkPerformanceCounterDescriptionFlagBitsKHR', 'int' # enum
  typealias 'VkAcquireProfilingLockFlagBitsKHR', 'int' # enum
  typealias 'VkSemaphoreWaitFlagBits', 'int' # enum
  typealias 'VkSemaphoreWaitFlagBitsKHR', 'int' # enum
  typealias 'VkPerformanceConfigurationTypeINTEL', 'int' # enum
  typealias 'VkQueryPoolSamplingModeINTEL', 'int' # enum
  typealias 'VkPerformanceOverrideTypeINTEL', 'int' # enum
  typealias 'VkPerformanceParameterTypeINTEL', 'int' # enum
  typealias 'VkPerformanceValueTypeINTEL', 'int' # enum
  typealias 'VkLineRasterizationModeEXT', 'int' # enum
  typealias 'VkShaderModuleCreateFlagBits', 'int' # enum
  typealias 'VkPipelineCompilerControlFlagBitsAMD', 'int' # enum
  typealias 'VkShaderCorePropertiesFlagBitsAMD', 'int' # enum
  typealias 'VkToolPurposeFlagBits', 'int' # enum
  typealias 'VkToolPurposeFlagBitsEXT', 'int' # enum
  typealias 'VkFragmentShadingRateNV', 'int' # enum
  typealias 'VkFragmentShadingRateTypeNV', 'int' # enum
  typealias 'VkAccessFlagBits2', 'int' # enum
  typealias 'VkAccessFlagBits2KHR', 'int' # enum
  typealias 'VkPipelineStageFlagBits2', 'int' # enum
  typealias 'VkPipelineStageFlagBits2KHR', 'int' # enum
  typealias 'VkProvokingVertexModeEXT', 'int' # enum
  typealias 'VkImageFormatConstraintsFlagBitsFUCHSIA', 'int' # enum
  typealias 'VkImageConstraintsInfoFlagBitsFUCHSIA', 'int' # enum
  typealias 'VkFormatFeatureFlagBits2', 'int' # enum
  typealias 'VkFormatFeatureFlagBits2KHR', 'int' # enum
  typealias 'VkRenderingFlagBits', 'int' # enum
  typealias 'VkRenderingFlagBitsKHR', 'int' # enum
  typealias 'VkPipelineDepthStencilStateCreateFlagBits', 'int' # enum
  typealias 'VkPipelineColorBlendStateCreateFlagBits', 'int' # enum
  typealias 'VkColorSpaceKHR', 'int' # enum
  typealias 'VkCompositeAlphaFlagBitsKHR', 'int' # enum
  typealias 'VkDisplayPlaneAlphaFlagBitsKHR', 'int' # enum
  typealias 'VkPresentModeKHR', 'int' # enum
  typealias 'VkSurfaceTransformFlagBitsKHR', 'int' # enum
  typealias 'VkDebugReportFlagBitsEXT', 'int' # enum
  typealias 'VkDebugReportObjectTypeEXT', 'int' # enum
  typealias 'VkDeviceMemoryReportEventTypeEXT', 'int' # enum
  typealias 'VkRasterizationOrderAMD', 'int' # enum
  typealias 'VkExternalMemoryHandleTypeFlagBitsNV', 'int' # enum
  typealias 'VkExternalMemoryFeatureFlagBitsNV', 'int' # enum
  typealias 'VkValidationCheckEXT', 'int' # enum
  typealias 'VkValidationFeatureEnableEXT', 'int' # enum
  typealias 'VkValidationFeatureDisableEXT', 'int' # enum
  typealias 'VkExternalMemoryHandleTypeFlagBits', 'int' # enum
  typealias 'VkExternalMemoryHandleTypeFlagBitsKHR', 'int' # enum
  typealias 'VkExternalMemoryFeatureFlagBits', 'int' # enum
  typealias 'VkExternalMemoryFeatureFlagBitsKHR', 'int' # enum
  typealias 'VkExternalSemaphoreHandleTypeFlagBits', 'int' # enum
  typealias 'VkExternalSemaphoreHandleTypeFlagBitsKHR', 'int' # enum
  typealias 'VkExternalSemaphoreFeatureFlagBits', 'int' # enum
  typealias 'VkExternalSemaphoreFeatureFlagBitsKHR', 'int' # enum
  typealias 'VkSemaphoreImportFlagBits', 'int' # enum
  typealias 'VkSemaphoreImportFlagBitsKHR', 'int' # enum
  typealias 'VkExternalFenceHandleTypeFlagBits', 'int' # enum
  typealias 'VkExternalFenceHandleTypeFlagBitsKHR', 'int' # enum
  typealias 'VkExternalFenceFeatureFlagBits', 'int' # enum
  typealias 'VkExternalFenceFeatureFlagBitsKHR', 'int' # enum
  typealias 'VkFenceImportFlagBits', 'int' # enum
  typealias 'VkFenceImportFlagBitsKHR', 'int' # enum
  typealias 'VkSurfaceCounterFlagBitsEXT', 'int' # enum
  typealias 'VkDisplayPowerStateEXT', 'int' # enum
  typealias 'VkDeviceEventTypeEXT', 'int' # enum
  typealias 'VkDisplayEventTypeEXT', 'int' # enum
  typealias 'VkPeerMemoryFeatureFlagBits', 'int' # enum
  typealias 'VkPeerMemoryFeatureFlagBitsKHR', 'int' # enum
  typealias 'VkMemoryAllocateFlagBits', 'int' # enum
  typealias 'VkMemoryAllocateFlagBitsKHR', 'int' # enum
  typealias 'VkDeviceGroupPresentModeFlagBitsKHR', 'int' # enum
  typealias 'VkSwapchainCreateFlagBitsKHR', 'int' # enum
  typealias 'VkSubgroupFeatureFlagBits', 'int' # enum
  typealias 'VkTessellationDomainOrigin', 'int' # enum
  typealias 'VkTessellationDomainOriginKHR', 'int' # enum
  typealias 'VkSamplerYcbcrModelConversion', 'int' # enum
  typealias 'VkSamplerYcbcrModelConversionKHR', 'int' # enum
  typealias 'VkSamplerYcbcrRange', 'int' # enum
  typealias 'VkSamplerYcbcrRangeKHR', 'int' # enum
  typealias 'VkChromaLocation', 'int' # enum
  typealias 'VkChromaLocationKHR', 'int' # enum
  typealias 'VkSamplerReductionMode', 'int' # enum
  typealias 'VkSamplerReductionModeEXT', 'int' # enum
  typealias 'VkBlendOverlapEXT', 'int' # enum
  typealias 'VkDebugUtilsMessageSeverityFlagBitsEXT', 'int' # enum
  typealias 'VkDebugUtilsMessageTypeFlagBitsEXT', 'int' # enum
  typealias 'VkFullScreenExclusiveEXT', 'int' # enum
  typealias 'VkShaderFloatControlsIndependence', 'int' # enum
  typealias 'VkShaderFloatControlsIndependenceKHR', 'int' # enum
  typealias 'VkSwapchainImageUsageFlagBitsANDROID', 'int' # enum
  typealias 'VkFragmentShadingRateCombinerOpKHR', 'int' # enum
  typealias 'VkSubmitFlagBits', 'int' # enum
  typealias 'VkSubmitFlagBitsKHR', 'int' # enum
  typealias 'VkVendorId', 'int' # enum
  typealias 'VkDriverId', 'int' # enum
  typealias 'VkDriverIdKHR', 'int' # enum
  typealias 'VkShadingRatePaletteEntryNV', 'int' # enum
  typealias 'VkCoarseSampleOrderTypeNV', 'int' # enum
  typealias 'VkPipelineExecutableStatisticFormatKHR', 'int' # enum
  typealias 'VkVideoCodecOperationFlagBitsKHR', 'int' # enum
  typealias 'VkVideoChromaSubsamplingFlagBitsKHR', 'int' # enum
  typealias 'VkVideoComponentBitDepthFlagBitsKHR', 'int' # enum
  typealias 'VkVideoCapabilityFlagBitsKHR', 'int' # enum
  typealias 'VkVideoSessionCreateFlagBitsKHR', 'int' # enum
  typealias 'VkVideoCodingQualityPresetFlagBitsKHR', 'int' # enum
  typealias 'VkVideoCodingControlFlagBitsKHR', 'int' # enum
  typealias 'VkQueryResultStatusKHR', 'int' # enum
  typealias 'VkVideoDecodeCapabilityFlagBitsKHR', 'int' # enum
  typealias 'VkVideoDecodeFlagBitsKHR', 'int' # enum
  typealias 'VkVideoDecodeH264PictureLayoutFlagBitsEXT', 'int' # enum
  typealias 'VkVideoEncodeFlagBitsKHR', 'int' # enum
  typealias 'VkVideoEncodeCapabilityFlagBitsKHR', 'int' # enum
  typealias 'VkVideoEncodeRateControlFlagBitsKHR', 'int' # enum
  typealias 'VkVideoEncodeRateControlModeFlagBitsKHR', 'int' # enum
  typealias 'VkVideoEncodeH264CapabilityFlagBitsEXT', 'int' # enum
  typealias 'VkVideoEncodeH264InputModeFlagBitsEXT', 'int' # enum
  typealias 'VkVideoEncodeH264OutputModeFlagBitsEXT', 'int' # enum
  typealias 'VkVideoEncodeH264CreateFlagBitsEXT', 'int' # enum
  typealias 'VkVideoEncodeH264RateControlStructureFlagBitsEXT', 'int' # enum
  typealias 'VkVideoEncodeH265CapabilityFlagBitsEXT', 'int' # enum
  typealias 'VkVideoEncodeH265InputModeFlagBitsEXT', 'int' # enum
  typealias 'VkVideoEncodeH265OutputModeFlagBitsEXT', 'int' # enum
  typealias 'VkVideoEncodeH265RateControlStructureFlagBitsEXT', 'int' # enum
  typealias 'VkVideoEncodeH265CtbSizeFlagBitsEXT', 'int' # enum
  typealias 'VkVideoEncodeH265TransformBlockSizeFlagBitsEXT', 'int' # enum
  typealias 'PFN_vkInternalAllocationNotification', 'void *' # function pointer
  typealias 'PFN_vkInternalFreeNotification', 'void *' # function pointer
  typealias 'PFN_vkReallocationFunction', 'void *' # function pointer
  typealias 'PFN_vkAllocationFunction', 'void *' # function pointer
  typealias 'PFN_vkFreeFunction', 'void *' # function pointer
  typealias 'PFN_vkVoidFunction', 'void *' # function pointer
  typealias 'PFN_vkDebugReportCallbackEXT', 'void *' # function pointer
  typealias 'PFN_vkDebugUtilsMessengerCallbackEXT', 'void *' # function pointer
  typealias 'PFN_vkDeviceMemoryReportCallbackEXT', 'void *' # function pointer
  typealias 'StdVideoH264ProfileIdc', 'void *' unless send(:type_alias).key?('StdVideoH264ProfileIdc') # defined in vk_video/vulkan_video_codec_h264std.h
  typealias 'StdVideoH264Level', 'void *' unless send(:type_alias).key?('StdVideoH264Level') # defined in vk_video/vulkan_video_codec_h264std.h
  typealias 'StdVideoH264ChromaFormatIdc', 'void *' unless send(:type_alias).key?('StdVideoH264ChromaFormatIdc') # defined in vk_video/vulkan_video_codec_h264std.h
  typealias 'StdVideoH264PocType', 'void *' unless send(:type_alias).key?('StdVideoH264PocType') # defined in vk_video/vulkan_video_codec_h264std.h
  typealias 'StdVideoH264SpsFlags', 'void *' unless send(:type_alias).key?('StdVideoH264SpsFlags') # defined in vk_video/vulkan_video_codec_h264std.h
  typealias 'StdVideoH264ScalingLists', 'void *' unless send(:type_alias).key?('StdVideoH264ScalingLists') # defined in vk_video/vulkan_video_codec_h264std.h
  typealias 'StdVideoH264SequenceParameterSetVui', 'void *' unless send(:type_alias).key?('StdVideoH264SequenceParameterSetVui') # defined in vk_video/vulkan_video_codec_h264std.h
  typealias 'StdVideoH264AspectRatioIdc', 'void *' unless send(:type_alias).key?('StdVideoH264AspectRatioIdc') # defined in vk_video/vulkan_video_codec_h264std.h
  typealias 'StdVideoH264HrdParameters', 'void *' unless send(:type_alias).key?('StdVideoH264HrdParameters') # defined in vk_video/vulkan_video_codec_h264std.h
  typealias 'StdVideoH264SpsVuiFlags', 'void *' unless send(:type_alias).key?('StdVideoH264SpsVuiFlags') # defined in vk_video/vulkan_video_codec_h264std.h
  typealias 'StdVideoH264WeightedBipredIdc', 'void *' unless send(:type_alias).key?('StdVideoH264WeightedBipredIdc') # defined in vk_video/vulkan_video_codec_h264std.h
  typealias 'StdVideoH264PpsFlags', 'void *' unless send(:type_alias).key?('StdVideoH264PpsFlags') # defined in vk_video/vulkan_video_codec_h264std.h
  typealias 'StdVideoH264SliceType', 'void *' unless send(:type_alias).key?('StdVideoH264SliceType') # defined in vk_video/vulkan_video_codec_h264std.h
  typealias 'StdVideoH264CabacInitIdc', 'void *' unless send(:type_alias).key?('StdVideoH264CabacInitIdc') # defined in vk_video/vulkan_video_codec_h264std.h
  typealias 'StdVideoH264DisableDeblockingFilterIdc', 'void *' unless send(:type_alias).key?('StdVideoH264DisableDeblockingFilterIdc') # defined in vk_video/vulkan_video_codec_h264std.h
  typealias 'StdVideoH264PictureType', 'void *' unless send(:type_alias).key?('StdVideoH264PictureType') # defined in vk_video/vulkan_video_codec_h264std.h
  typealias 'StdVideoH264ModificationOfPicNumsIdc', 'void *' unless send(:type_alias).key?('StdVideoH264ModificationOfPicNumsIdc') # defined in vk_video/vulkan_video_codec_h264std.h
  typealias 'StdVideoH264MemMgmtControlOp', 'void *' unless send(:type_alias).key?('StdVideoH264MemMgmtControlOp') # defined in vk_video/vulkan_video_codec_h264std.h
  typealias 'StdVideoDecodeH264PictureInfo', 'void *' unless send(:type_alias).key?('StdVideoDecodeH264PictureInfo') # defined in vk_video/vulkan_video_codec_h264std_decode.h
  typealias 'StdVideoDecodeH264ReferenceInfo', 'void *' unless send(:type_alias).key?('StdVideoDecodeH264ReferenceInfo') # defined in vk_video/vulkan_video_codec_h264std_decode.h
  typealias 'StdVideoDecodeH264Mvc', 'void *' unless send(:type_alias).key?('StdVideoDecodeH264Mvc') # defined in vk_video/vulkan_video_codec_h264std_decode.h
  typealias 'StdVideoDecodeH264PictureInfoFlags', 'void *' unless send(:type_alias).key?('StdVideoDecodeH264PictureInfoFlags') # defined in vk_video/vulkan_video_codec_h264std_decode.h
  typealias 'StdVideoDecodeH264ReferenceInfoFlags', 'void *' unless send(:type_alias).key?('StdVideoDecodeH264ReferenceInfoFlags') # defined in vk_video/vulkan_video_codec_h264std_decode.h
  typealias 'StdVideoDecodeH264MvcElement', 'void *' unless send(:type_alias).key?('StdVideoDecodeH264MvcElement') # defined in vk_video/vulkan_video_codec_h264std_decode.h
  typealias 'StdVideoDecodeH264MvcElementFlags', 'void *' unless send(:type_alias).key?('StdVideoDecodeH264MvcElementFlags') # defined in vk_video/vulkan_video_codec_h264std_decode.h
  typealias 'StdVideoH264SequenceParameterSet', 'void *' unless send(:type_alias).key?('StdVideoH264SequenceParameterSet') # defined in vk_video/vulkan_video_codec_h264std.h
  typealias 'StdVideoH264PictureParameterSet', 'void *' unless send(:type_alias).key?('StdVideoH264PictureParameterSet') # defined in vk_video/vulkan_video_codec_h264std.h
  typealias 'StdVideoH265ProfileIdc', 'void *' unless send(:type_alias).key?('StdVideoH265ProfileIdc') # defined in vk_video/vulkan_video_codec_h265std.h
  typealias 'StdVideoH265VideoParameterSet', 'void *' unless send(:type_alias).key?('StdVideoH265VideoParameterSet') # defined in vk_video/vulkan_video_codec_h265std.h
  typealias 'StdVideoH265SequenceParameterSet', 'void *' unless send(:type_alias).key?('StdVideoH265SequenceParameterSet') # defined in vk_video/vulkan_video_codec_h265std.h
  typealias 'StdVideoH265PictureParameterSet', 'void *' unless send(:type_alias).key?('StdVideoH265PictureParameterSet') # defined in vk_video/vulkan_video_codec_h265std.h
  typealias 'StdVideoH265DecPicBufMgr', 'void *' unless send(:type_alias).key?('StdVideoH265DecPicBufMgr') # defined in vk_video/vulkan_video_codec_h265std.h
  typealias 'StdVideoH265HrdParameters', 'void *' unless send(:type_alias).key?('StdVideoH265HrdParameters') # defined in vk_video/vulkan_video_codec_h265std.h
  typealias 'StdVideoH265VpsFlags', 'void *' unless send(:type_alias).key?('StdVideoH265VpsFlags') # defined in vk_video/vulkan_video_codec_h265std.h
  typealias 'StdVideoH265Level', 'void *' unless send(:type_alias).key?('StdVideoH265Level') # defined in vk_video/vulkan_video_codec_h265std.h
  typealias 'StdVideoH265SpsFlags', 'void *' unless send(:type_alias).key?('StdVideoH265SpsFlags') # defined in vk_video/vulkan_video_codec_h265std.h
  typealias 'StdVideoH265ScalingLists', 'void *' unless send(:type_alias).key?('StdVideoH265ScalingLists') # defined in vk_video/vulkan_video_codec_h265std.h
  typealias 'StdVideoH265SequenceParameterSetVui', 'void *' unless send(:type_alias).key?('StdVideoH265SequenceParameterSetVui') # defined in vk_video/vulkan_video_codec_h265std.h
  typealias 'StdVideoH265PredictorPaletteEntries', 'void *' unless send(:type_alias).key?('StdVideoH265PredictorPaletteEntries') # defined in vk_video/vulkan_video_codec_h265std.h
  typealias 'StdVideoH265PpsFlags', 'void *' unless send(:type_alias).key?('StdVideoH265PpsFlags') # defined in vk_video/vulkan_video_codec_h265std.h
  typealias 'StdVideoH265SubLayerHrdParameters', 'void *' unless send(:type_alias).key?('StdVideoH265SubLayerHrdParameters') # defined in vk_video/vulkan_video_codec_h265std.h
  typealias 'StdVideoH265HrdFlags', 'void *' unless send(:type_alias).key?('StdVideoH265HrdFlags') # defined in vk_video/vulkan_video_codec_h265std.h
  typealias 'StdVideoH265SpsVuiFlags', 'void *' unless send(:type_alias).key?('StdVideoH265SpsVuiFlags') # defined in vk_video/vulkan_video_codec_h265std.h
  typealias 'StdVideoH265SliceType', 'void *' unless send(:type_alias).key?('StdVideoH265SliceType') # defined in vk_video/vulkan_video_codec_h265std.h
  typealias 'StdVideoH265PictureType', 'void *' unless send(:type_alias).key?('StdVideoH265PictureType') # defined in vk_video/vulkan_video_codec_h265std.h
  typealias 'StdVideoDecodeH265PictureInfo', 'void *' unless send(:type_alias).key?('StdVideoDecodeH265PictureInfo') # defined in vk_video/vulkan_video_codec_h265std_decode.h
  typealias 'StdVideoDecodeH265ReferenceInfo', 'void *' unless send(:type_alias).key?('StdVideoDecodeH265ReferenceInfo') # defined in vk_video/vulkan_video_codec_h265std_decode.h
  typealias 'StdVideoDecodeH265PictureInfoFlags', 'void *' unless send(:type_alias).key?('StdVideoDecodeH265PictureInfoFlags') # defined in vk_video/vulkan_video_codec_h265std_decode.h
  typealias 'StdVideoDecodeH265ReferenceInfoFlags', 'void *' unless send(:type_alias).key?('StdVideoDecodeH265ReferenceInfoFlags') # defined in vk_video/vulkan_video_codec_h265std_decode.h
  typealias 'StdVideoEncodeH264SliceHeader', 'void *' unless send(:type_alias).key?('StdVideoEncodeH264SliceHeader') # defined in vk_video/vulkan_video_codec_h264std_encode.h
  typealias 'StdVideoEncodeH264PictureInfo', 'void *' unless send(:type_alias).key?('StdVideoEncodeH264PictureInfo') # defined in vk_video/vulkan_video_codec_h264std_encode.h
  typealias 'StdVideoEncodeH264ReferenceInfo', 'void *' unless send(:type_alias).key?('StdVideoEncodeH264ReferenceInfo') # defined in vk_video/vulkan_video_codec_h264std_encode.h
  typealias 'StdVideoEncodeH264SliceHeaderFlags', 'void *' unless send(:type_alias).key?('StdVideoEncodeH264SliceHeaderFlags') # defined in vk_video/vulkan_video_codec_h264std_encode.h
  typealias 'StdVideoEncodeH264RefMemMgmtCtrlOperations', 'void *' unless send(:type_alias).key?('StdVideoEncodeH264RefMemMgmtCtrlOperations') # defined in vk_video/vulkan_video_codec_h264std_encode.h
  typealias 'StdVideoEncodeH264PictureInfoFlags', 'void *' unless send(:type_alias).key?('StdVideoEncodeH264PictureInfoFlags') # defined in vk_video/vulkan_video_codec_h264std_encode.h
  typealias 'StdVideoEncodeH264ReferenceInfoFlags', 'void *' unless send(:type_alias).key?('StdVideoEncodeH264ReferenceInfoFlags') # defined in vk_video/vulkan_video_codec_h264std_encode.h
  typealias 'StdVideoEncodeH264RefMgmtFlags', 'void *' unless send(:type_alias).key?('StdVideoEncodeH264RefMgmtFlags') # defined in vk_video/vulkan_video_codec_h264std_encode.h
  typealias 'StdVideoEncodeH264RefListModEntry', 'void *' unless send(:type_alias).key?('StdVideoEncodeH264RefListModEntry') # defined in vk_video/vulkan_video_codec_h264std_encode.h
  typealias 'StdVideoEncodeH264RefPicMarkingEntry', 'void *' unless send(:type_alias).key?('StdVideoEncodeH264RefPicMarkingEntry') # defined in vk_video/vulkan_video_codec_h264std_encode.h
  typealias 'StdVideoEncodeH265PictureInfoFlags', 'void *' unless send(:type_alias).key?('StdVideoEncodeH265PictureInfoFlags') # defined in vk_video/vulkan_video_codec_h265std_encode.h
  typealias 'StdVideoEncodeH265PictureInfo', 'void *' unless send(:type_alias).key?('StdVideoEncodeH265PictureInfo') # defined in vk_video/vulkan_video_codec_h265std_encode.h
  typealias 'StdVideoEncodeH265SliceSegmentHeader', 'void *' unless send(:type_alias).key?('StdVideoEncodeH265SliceSegmentHeader') # defined in vk_video/vulkan_video_codec_h265std_encode.h
  typealias 'StdVideoEncodeH265ReferenceInfo', 'void *' unless send(:type_alias).key?('StdVideoEncodeH265ReferenceInfo') # defined in vk_video/vulkan_video_codec_h265std_encode.h
  typealias 'StdVideoEncodeH265ReferenceModifications', 'void *' unless send(:type_alias).key?('StdVideoEncodeH265ReferenceModifications') # defined in vk_video/vulkan_video_codec_h265std_encode.h
  typealias 'StdVideoEncodeH265SliceSegmentHeaderFlags', 'void *' unless send(:type_alias).key?('StdVideoEncodeH265SliceSegmentHeaderFlags') # defined in vk_video/vulkan_video_codec_h265std_encode.h
  typealias 'StdVideoEncodeH265ReferenceInfoFlags', 'void *' unless send(:type_alias).key?('StdVideoEncodeH265ReferenceInfoFlags') # defined in vk_video/vulkan_video_codec_h265std_encode.h
  typealias 'StdVideoEncodeH265ReferenceModificationFlags', 'void *' unless send(:type_alias).key?('StdVideoEncodeH265ReferenceModificationFlags') # defined in vk_video/vulkan_video_codec_h265std_encode.h
  typealias 'VkAccelerationStructureMotionInstanceTypeNV', 'int' # enum
  typealias 'VkRemoteAddressNV', 'void'
  typealias 'VkGeometryFlagsNV', 'VkGeometryFlagsKHR'
  typealias 'VkGeometryInstanceFlagsNV', 'VkGeometryInstanceFlagsKHR'
  typealias 'VkBuildAccelerationStructureFlagsNV', 'VkBuildAccelerationStructureFlagsKHR'
  typealias 'VkPrivateDataSlotCreateFlagsEXT', 'VkPrivateDataSlotCreateFlags'
  typealias 'VkDescriptorUpdateTemplateCreateFlagsKHR', 'VkDescriptorUpdateTemplateCreateFlags'
  typealias 'VkPipelineCreationFeedbackFlagsEXT', 'VkPipelineCreationFeedbackFlags'
  typealias 'VkSemaphoreWaitFlagsKHR', 'VkSemaphoreWaitFlags'
  typealias 'VkAccessFlags2KHR', 'VkAccessFlags2'
  typealias 'VkPipelineStageFlags2KHR', 'VkPipelineStageFlags2'
  typealias 'VkFormatFeatureFlags2KHR', 'VkFormatFeatureFlags2'
  typealias 'VkRenderingFlagsKHR', 'VkRenderingFlags'
  typealias 'VkPeerMemoryFeatureFlagsKHR', 'VkPeerMemoryFeatureFlags'
  typealias 'VkMemoryAllocateFlagsKHR', 'VkMemoryAllocateFlags'
  typealias 'VkCommandPoolTrimFlagsKHR', 'VkCommandPoolTrimFlags'
  typealias 'VkExternalMemoryHandleTypeFlagsKHR', 'VkExternalMemoryHandleTypeFlags'
  typealias 'VkExternalMemoryFeatureFlagsKHR', 'VkExternalMemoryFeatureFlags'
  typealias 'VkExternalSemaphoreHandleTypeFlagsKHR', 'VkExternalSemaphoreHandleTypeFlags'
  typealias 'VkExternalSemaphoreFeatureFlagsKHR', 'VkExternalSemaphoreFeatureFlags'
  typealias 'VkSemaphoreImportFlagsKHR', 'VkSemaphoreImportFlags'
  typealias 'VkExternalFenceHandleTypeFlagsKHR', 'VkExternalFenceHandleTypeFlags'
  typealias 'VkExternalFenceFeatureFlagsKHR', 'VkExternalFenceFeatureFlags'
  typealias 'VkFenceImportFlagsKHR', 'VkFenceImportFlags'
  typealias 'VkDescriptorBindingFlagsEXT', 'VkDescriptorBindingFlags'
  typealias 'VkResolveModeFlagsKHR', 'VkResolveModeFlags'
  typealias 'VkToolPurposeFlagsEXT', 'VkToolPurposeFlags'
  typealias 'VkSubmitFlagsKHR', 'VkSubmitFlags'
end
