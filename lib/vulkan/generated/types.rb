# vulkan-ruby 1.0.83.0
#
#   => https://github.com/sinisterchipmunk/vulkan-ruby
#
# [NOTICE] This is an automatically generated file.

module Vulkan
  typealias 'VkSampleMask', 'uint32_t'
  typealias 'VkBool32', 'uint32_t'
  typealias 'VkFlags', 'uint32_t'
  typealias 'VkDeviceSize', 'uint64_t'
  VkFramebufferCreateFlags                                =       -Fiddle::TYPE_INT
  VkQueryPoolCreateFlags                                  =       -Fiddle::TYPE_INT
  VkRenderPassCreateFlags                                 =       -Fiddle::TYPE_INT
  VkSamplerCreateFlags                                    =       -Fiddle::TYPE_INT
  VkPipelineLayoutCreateFlags                             =       -Fiddle::TYPE_INT
  VkPipelineCacheCreateFlags                              =       -Fiddle::TYPE_INT
  VkPipelineDepthStencilStateCreateFlags                  =       -Fiddle::TYPE_INT
  VkPipelineDynamicStateCreateFlags                       =       -Fiddle::TYPE_INT
  VkPipelineColorBlendStateCreateFlags                    =       -Fiddle::TYPE_INT
  VkPipelineMultisampleStateCreateFlags                   =       -Fiddle::TYPE_INT
  VkPipelineRasterizationStateCreateFlags                 =       -Fiddle::TYPE_INT
  VkPipelineViewportStateCreateFlags                      =       -Fiddle::TYPE_INT
  VkPipelineTessellationStateCreateFlags                  =       -Fiddle::TYPE_INT
  VkPipelineInputAssemblyStateCreateFlags                 =       -Fiddle::TYPE_INT
  VkPipelineVertexInputStateCreateFlags                   =       -Fiddle::TYPE_INT
  VkPipelineShaderStageCreateFlags                        =       -Fiddle::TYPE_INT
  VkDescriptorSetLayoutCreateFlags                        =       -Fiddle::TYPE_INT
  VkBufferViewCreateFlags                                 =       -Fiddle::TYPE_INT
  VkInstanceCreateFlags                                   =       -Fiddle::TYPE_INT
  VkDeviceCreateFlags                                     =       -Fiddle::TYPE_INT
  VkDeviceQueueCreateFlags                                =       -Fiddle::TYPE_INT
  VkQueueFlags                                            =       -Fiddle::TYPE_INT
  VkMemoryPropertyFlags                                   =       -Fiddle::TYPE_INT
  VkMemoryHeapFlags                                       =       -Fiddle::TYPE_INT
  VkAccessFlags                                           =       -Fiddle::TYPE_INT
  VkBufferUsageFlags                                      =       -Fiddle::TYPE_INT
  VkBufferCreateFlags                                     =       -Fiddle::TYPE_INT
  VkShaderStageFlags                                      =       -Fiddle::TYPE_INT
  VkImageUsageFlags                                       =       -Fiddle::TYPE_INT
  VkImageCreateFlags                                      =       -Fiddle::TYPE_INT
  VkImageViewCreateFlags                                  =       -Fiddle::TYPE_INT
  VkPipelineCreateFlags                                   =       -Fiddle::TYPE_INT
  VkColorComponentFlags                                   =       -Fiddle::TYPE_INT
  VkFenceCreateFlags                                      =       -Fiddle::TYPE_INT
  VkSemaphoreCreateFlags                                  =       -Fiddle::TYPE_INT
  VkFormatFeatureFlags                                    =       -Fiddle::TYPE_INT
  VkQueryControlFlags                                     =       -Fiddle::TYPE_INT
  VkQueryResultFlags                                      =       -Fiddle::TYPE_INT
  VkShaderModuleCreateFlags                               =       -Fiddle::TYPE_INT
  VkEventCreateFlags                                      =       -Fiddle::TYPE_INT
  VkCommandPoolCreateFlags                                =       -Fiddle::TYPE_INT
  VkCommandPoolResetFlags                                 =       -Fiddle::TYPE_INT
  VkCommandBufferResetFlags                               =       -Fiddle::TYPE_INT
  VkCommandBufferUsageFlags                               =       -Fiddle::TYPE_INT
  VkQueryPipelineStatisticFlags                           =       -Fiddle::TYPE_INT
  VkMemoryMapFlags                                        =       -Fiddle::TYPE_INT
  VkImageAspectFlags                                      =       -Fiddle::TYPE_INT
  VkSparseMemoryBindFlags                                 =       -Fiddle::TYPE_INT
  VkSparseImageFormatFlags                                =       -Fiddle::TYPE_INT
  VkSubpassDescriptionFlags                               =       -Fiddle::TYPE_INT
  VkPipelineStageFlags                                    =       -Fiddle::TYPE_INT
  VkSampleCountFlags                                      =       -Fiddle::TYPE_INT
  VkAttachmentDescriptionFlags                            =       -Fiddle::TYPE_INT
  VkStencilFaceFlags                                      =       -Fiddle::TYPE_INT
  VkCullModeFlags                                         =       -Fiddle::TYPE_INT
  VkDescriptorPoolCreateFlags                             =       -Fiddle::TYPE_INT
  VkDescriptorPoolResetFlags                              =       -Fiddle::TYPE_INT
  VkDependencyFlags                                       =       -Fiddle::TYPE_INT
  VkSubgroupFeatureFlags                                  =       -Fiddle::TYPE_INT
  VkIndirectCommandsLayoutUsageFlagsNVX                   =       -Fiddle::TYPE_INT
  VkObjectEntryUsageFlagsNVX                              =       -Fiddle::TYPE_INT
  VkGeometryFlagsNVX                                      =       -Fiddle::TYPE_INT
  VkGeometryInstanceFlagsNVX                              =       -Fiddle::TYPE_INT
  VkBuildAccelerationStructureFlagsNVX                    =       -Fiddle::TYPE_INT
  VkDescriptorUpdateTemplateCreateFlags                   =       -Fiddle::TYPE_INT
  VkDescriptorUpdateTemplateCreateFlagsKHR                =       -Fiddle::TYPE_INT
  VkCompositeAlphaFlagsKHR                                =       -Fiddle::TYPE_INT
  VkDisplayPlaneAlphaFlagsKHR                             =       -Fiddle::TYPE_INT
  VkSurfaceTransformFlagsKHR                              =       -Fiddle::TYPE_INT
  VkSwapchainCreateFlagsKHR                               =       -Fiddle::TYPE_INT
  VkDisplayModeCreateFlagsKHR                             =       -Fiddle::TYPE_INT
  VkDisplaySurfaceCreateFlagsKHR                          =       -Fiddle::TYPE_INT
  VkAndroidSurfaceCreateFlagsKHR                          =       -Fiddle::TYPE_INT
  VkMirSurfaceCreateFlagsKHR                              =       -Fiddle::TYPE_INT
  VkViSurfaceCreateFlagsNN                                =       -Fiddle::TYPE_INT
  VkWaylandSurfaceCreateFlagsKHR                          =       -Fiddle::TYPE_INT
  VkWin32SurfaceCreateFlagsKHR                            =       -Fiddle::TYPE_INT
  VkXlibSurfaceCreateFlagsKHR                             =       -Fiddle::TYPE_INT
  VkXcbSurfaceCreateFlagsKHR                              =       -Fiddle::TYPE_INT
  VkIOSSurfaceCreateFlagsMVK                              =       -Fiddle::TYPE_INT
  VkMacOSSurfaceCreateFlagsMVK                            =       -Fiddle::TYPE_INT
  VkImagePipeSurfaceCreateFlagsFUCHSIA                    =       -Fiddle::TYPE_INT
  VkPeerMemoryFeatureFlags                                =       -Fiddle::TYPE_INT
  VkPeerMemoryFeatureFlagsKHR                             =       -Fiddle::TYPE_INT
  VkMemoryAllocateFlags                                   =       -Fiddle::TYPE_INT
  VkMemoryAllocateFlagsKHR                                =       -Fiddle::TYPE_INT
  VkDeviceGroupPresentModeFlagsKHR                        =       -Fiddle::TYPE_INT
  VkDebugReportFlagsEXT                                   =       -Fiddle::TYPE_INT
  VkCommandPoolTrimFlags                                  =       -Fiddle::TYPE_INT
  VkCommandPoolTrimFlagsKHR                               =       -Fiddle::TYPE_INT
  VkExternalMemoryHandleTypeFlagsNV                       =       -Fiddle::TYPE_INT
  VkExternalMemoryFeatureFlagsNV                          =       -Fiddle::TYPE_INT
  VkExternalMemoryHandleTypeFlags                         =       -Fiddle::TYPE_INT
  VkExternalMemoryHandleTypeFlagsKHR                      =       -Fiddle::TYPE_INT
  VkExternalMemoryFeatureFlags                            =       -Fiddle::TYPE_INT
  VkExternalMemoryFeatureFlagsKHR                         =       -Fiddle::TYPE_INT
  VkExternalSemaphoreHandleTypeFlags                      =       -Fiddle::TYPE_INT
  VkExternalSemaphoreHandleTypeFlagsKHR                   =       -Fiddle::TYPE_INT
  VkExternalSemaphoreFeatureFlags                         =       -Fiddle::TYPE_INT
  VkExternalSemaphoreFeatureFlagsKHR                      =       -Fiddle::TYPE_INT
  VkSemaphoreImportFlags                                  =       -Fiddle::TYPE_INT
  VkSemaphoreImportFlagsKHR                               =       -Fiddle::TYPE_INT
  VkExternalFenceHandleTypeFlags                          =       -Fiddle::TYPE_INT
  VkExternalFenceHandleTypeFlagsKHR                       =       -Fiddle::TYPE_INT
  VkExternalFenceFeatureFlags                             =       -Fiddle::TYPE_INT
  VkExternalFenceFeatureFlagsKHR                          =       -Fiddle::TYPE_INT
  VkFenceImportFlags                                      =       -Fiddle::TYPE_INT
  VkFenceImportFlagsKHR                                   =       -Fiddle::TYPE_INT
  VkSurfaceCounterFlagsEXT                                =       -Fiddle::TYPE_INT
  VkPipelineViewportSwizzleStateCreateFlagsNV             =       -Fiddle::TYPE_INT
  VkPipelineDiscardRectangleStateCreateFlagsEXT           =       -Fiddle::TYPE_INT
  VkPipelineCoverageToColorStateCreateFlagsNV             =       -Fiddle::TYPE_INT
  VkPipelineCoverageModulationStateCreateFlagsNV          =       -Fiddle::TYPE_INT
  VkValidationCacheCreateFlagsEXT                         =       -Fiddle::TYPE_INT
  VkDebugUtilsMessageSeverityFlagsEXT                     =       -Fiddle::TYPE_INT
  VkDebugUtilsMessageTypeFlagsEXT                         =       -Fiddle::TYPE_INT
  VkDebugUtilsMessengerCreateFlagsEXT                     =       -Fiddle::TYPE_INT
  VkDebugUtilsMessengerCallbackDataFlagsEXT               =       -Fiddle::TYPE_INT
  VkPipelineRasterizationConservativeStateCreateFlagsEXT  =       -Fiddle::TYPE_INT
  VkDescriptorBindingFlagsEXT                             =       -Fiddle::TYPE_INT
  VkConditionalRenderingFlagsEXT                          =       -Fiddle::TYPE_INT
  VkPipelineRasterizationStateStreamCreateFlagsEXT        =       -Fiddle::TYPE_INT
  VkInstance                                              =      Fiddle::TYPE_VOIDP
  VkPhysicalDevice                                        =      Fiddle::TYPE_VOIDP
  VkDevice                                                =      Fiddle::TYPE_VOIDP
  VkQueue                                                 =      Fiddle::TYPE_VOIDP
  VkCommandBuffer                                         =      Fiddle::TYPE_VOIDP
  VkDeviceMemory                                          =      Fiddle::TYPE_VOIDP
  VkCommandPool                                           =      Fiddle::TYPE_VOIDP
  VkBuffer                                                =      Fiddle::TYPE_VOIDP
  VkBufferView                                            =      Fiddle::TYPE_VOIDP
  VkImage                                                 =      Fiddle::TYPE_VOIDP
  VkImageView                                             =      Fiddle::TYPE_VOIDP
  VkShaderModule                                          =      Fiddle::TYPE_VOIDP
  VkPipeline                                              =      Fiddle::TYPE_VOIDP
  VkPipelineLayout                                        =      Fiddle::TYPE_VOIDP
  VkSampler                                               =      Fiddle::TYPE_VOIDP
  VkDescriptorSet                                         =      Fiddle::TYPE_VOIDP
  VkDescriptorSetLayout                                   =      Fiddle::TYPE_VOIDP
  VkDescriptorPool                                        =      Fiddle::TYPE_VOIDP
  VkFence                                                 =      Fiddle::TYPE_VOIDP
  VkSemaphore                                             =      Fiddle::TYPE_VOIDP
  VkEvent                                                 =      Fiddle::TYPE_VOIDP
  VkQueryPool                                             =      Fiddle::TYPE_VOIDP
  VkFramebuffer                                           =      Fiddle::TYPE_VOIDP
  VkRenderPass                                            =      Fiddle::TYPE_VOIDP
  VkPipelineCache                                         =      Fiddle::TYPE_VOIDP
  VkObjectTableNVX                                        =      Fiddle::TYPE_VOIDP
  VkIndirectCommandsLayoutNVX                             =      Fiddle::TYPE_VOIDP
  VkDescriptorUpdateTemplate                              =      Fiddle::TYPE_VOIDP
  VkDescriptorUpdateTemplateKHR                           =      Fiddle::TYPE_VOIDP
  VkSamplerYcbcrConversion                                =      Fiddle::TYPE_VOIDP
  VkSamplerYcbcrConversionKHR                             =      Fiddle::TYPE_VOIDP
  VkValidationCacheEXT                                    =      Fiddle::TYPE_VOIDP
  VkAccelerationStructureNVX                              =      Fiddle::TYPE_VOIDP
  VkDisplayKHR                                            =      Fiddle::TYPE_VOIDP
  VkDisplayModeKHR                                        =      Fiddle::TYPE_VOIDP
  VkSurfaceKHR                                            =      Fiddle::TYPE_VOIDP
  VkSwapchainKHR                                          =      Fiddle::TYPE_VOIDP
  VkDebugReportCallbackEXT                                =      Fiddle::TYPE_VOIDP
  VkDebugUtilsMessengerEXT                                =      Fiddle::TYPE_VOIDP
  typealias "PFN_vkInternalAllocationNotification", 'void *'
  typealias "PFN_vkInternalFreeNotification", 'void *'
  typealias "PFN_vkReallocationFunction", 'void *'
  typealias "PFN_vkAllocationFunction", 'void *'
  typealias "PFN_vkFreeFunction", 'void *'
  typealias "PFN_vkVoidFunction", 'void *'
  typealias "PFN_vkDebugReportCallbackEXT", 'void *'
  typealias "PFN_vkDebugUtilsMessengerCallbackEXT", 'void *'
  typealias "VkFramebufferCreateFlags", "VkFlags"
  typealias "VkQueryPoolCreateFlags", "VkFlags"
  typealias "VkRenderPassCreateFlags", "VkFlags"
  typealias "VkSamplerCreateFlags", "VkFlags"
  typealias "VkPipelineLayoutCreateFlags", "VkFlags"
  typealias "VkPipelineCacheCreateFlags", "VkFlags"
  typealias "VkPipelineDepthStencilStateCreateFlags", "VkFlags"
  typealias "VkPipelineDynamicStateCreateFlags", "VkFlags"
  typealias "VkPipelineColorBlendStateCreateFlags", "VkFlags"
  typealias "VkPipelineMultisampleStateCreateFlags", "VkFlags"
  typealias "VkPipelineRasterizationStateCreateFlags", "VkFlags"
  typealias "VkPipelineViewportStateCreateFlags", "VkFlags"
  typealias "VkPipelineTessellationStateCreateFlags", "VkFlags"
  typealias "VkPipelineInputAssemblyStateCreateFlags", "VkFlags"
  typealias "VkPipelineVertexInputStateCreateFlags", "VkFlags"
  typealias "VkPipelineShaderStageCreateFlags", "VkFlags"
  typealias "VkDescriptorSetLayoutCreateFlags", "VkFlags"
  typealias "VkBufferViewCreateFlags", "VkFlags"
  typealias "VkInstanceCreateFlags", "VkFlags"
  typealias "VkDeviceCreateFlags", "VkFlags"
  typealias "VkDeviceQueueCreateFlags", "VkFlags"
  typealias "VkQueueFlags", "VkFlags"
  typealias "VkMemoryPropertyFlags", "VkFlags"
  typealias "VkMemoryHeapFlags", "VkFlags"
  typealias "VkAccessFlags", "VkFlags"
  typealias "VkBufferUsageFlags", "VkFlags"
  typealias "VkBufferCreateFlags", "VkFlags"
  typealias "VkShaderStageFlags", "VkFlags"
  typealias "VkImageUsageFlags", "VkFlags"
  typealias "VkImageCreateFlags", "VkFlags"
  typealias "VkImageViewCreateFlags", "VkFlags"
  typealias "VkPipelineCreateFlags", "VkFlags"
  typealias "VkColorComponentFlags", "VkFlags"
  typealias "VkFenceCreateFlags", "VkFlags"
  typealias "VkSemaphoreCreateFlags", "VkFlags"
  typealias "VkFormatFeatureFlags", "VkFlags"
  typealias "VkQueryControlFlags", "VkFlags"
  typealias "VkQueryResultFlags", "VkFlags"
  typealias "VkShaderModuleCreateFlags", "VkFlags"
  typealias "VkEventCreateFlags", "VkFlags"
  typealias "VkCommandPoolCreateFlags", "VkFlags"
  typealias "VkCommandPoolResetFlags", "VkFlags"
  typealias "VkCommandBufferResetFlags", "VkFlags"
  typealias "VkCommandBufferUsageFlags", "VkFlags"
  typealias "VkQueryPipelineStatisticFlags", "VkFlags"
  typealias "VkMemoryMapFlags", "VkFlags"
  typealias "VkImageAspectFlags", "VkFlags"
  typealias "VkSparseMemoryBindFlags", "VkFlags"
  typealias "VkSparseImageFormatFlags", "VkFlags"
  typealias "VkSubpassDescriptionFlags", "VkFlags"
  typealias "VkPipelineStageFlags", "VkFlags"
  typealias "VkSampleCountFlags", "VkFlags"
  typealias "VkAttachmentDescriptionFlags", "VkFlags"
  typealias "VkStencilFaceFlags", "VkFlags"
  typealias "VkCullModeFlags", "VkFlags"
  typealias "VkDescriptorPoolCreateFlags", "VkFlags"
  typealias "VkDescriptorPoolResetFlags", "VkFlags"
  typealias "VkDependencyFlags", "VkFlags"
  typealias "VkSubgroupFeatureFlags", "VkFlags"
  typealias "VkIndirectCommandsLayoutUsageFlagsNVX", "VkFlags"
  typealias "VkObjectEntryUsageFlagsNVX", "VkFlags"
  typealias "VkGeometryFlagsNVX", "VkFlags"
  typealias "VkGeometryInstanceFlagsNVX", "VkFlags"
  typealias "VkBuildAccelerationStructureFlagsNVX", "VkFlags"
  typealias "VkDescriptorUpdateTemplateCreateFlags", "VkFlags"
  typealias "VkDescriptorUpdateTemplateCreateFlagsKHR", "VkFlags"
  typealias "VkCompositeAlphaFlagsKHR", "VkFlags"
  typealias "VkDisplayPlaneAlphaFlagsKHR", "VkFlags"
  typealias "VkSurfaceTransformFlagsKHR", "VkFlags"
  typealias "VkSwapchainCreateFlagsKHR", "VkFlags"
  typealias "VkDisplayModeCreateFlagsKHR", "VkFlags"
  typealias "VkDisplaySurfaceCreateFlagsKHR", "VkFlags"
  typealias "VkAndroidSurfaceCreateFlagsKHR", "VkFlags"
  typealias "VkMirSurfaceCreateFlagsKHR", "VkFlags"
  typealias "VkViSurfaceCreateFlagsNN", "VkFlags"
  typealias "VkWaylandSurfaceCreateFlagsKHR", "VkFlags"
  typealias "VkWin32SurfaceCreateFlagsKHR", "VkFlags"
  typealias "VkXlibSurfaceCreateFlagsKHR", "VkFlags"
  typealias "VkXcbSurfaceCreateFlagsKHR", "VkFlags"
  typealias "VkIOSSurfaceCreateFlagsMVK", "VkFlags"
  typealias "VkMacOSSurfaceCreateFlagsMVK", "VkFlags"
  typealias "VkImagePipeSurfaceCreateFlagsFUCHSIA", "VkFlags"
  typealias "VkPeerMemoryFeatureFlags", "VkFlags"
  typealias "VkPeerMemoryFeatureFlagsKHR", "VkFlags"
  typealias "VkMemoryAllocateFlags", "VkFlags"
  typealias "VkMemoryAllocateFlagsKHR", "VkFlags"
  typealias "VkDeviceGroupPresentModeFlagsKHR", "VkFlags"
  typealias "VkDebugReportFlagsEXT", "VkFlags"
  typealias "VkCommandPoolTrimFlags", "VkFlags"
  typealias "VkCommandPoolTrimFlagsKHR", "VkFlags"
  typealias "VkExternalMemoryHandleTypeFlagsNV", "VkFlags"
  typealias "VkExternalMemoryFeatureFlagsNV", "VkFlags"
  typealias "VkExternalMemoryHandleTypeFlags", "VkFlags"
  typealias "VkExternalMemoryHandleTypeFlagsKHR", "VkFlags"
  typealias "VkExternalMemoryFeatureFlags", "VkFlags"
  typealias "VkExternalMemoryFeatureFlagsKHR", "VkFlags"
  typealias "VkExternalSemaphoreHandleTypeFlags", "VkFlags"
  typealias "VkExternalSemaphoreHandleTypeFlagsKHR", "VkFlags"
  typealias "VkExternalSemaphoreFeatureFlags", "VkFlags"
  typealias "VkExternalSemaphoreFeatureFlagsKHR", "VkFlags"
  typealias "VkSemaphoreImportFlags", "VkFlags"
  typealias "VkSemaphoreImportFlagsKHR", "VkFlags"
  typealias "VkExternalFenceHandleTypeFlags", "VkFlags"
  typealias "VkExternalFenceHandleTypeFlagsKHR", "VkFlags"
  typealias "VkExternalFenceFeatureFlags", "VkFlags"
  typealias "VkExternalFenceFeatureFlagsKHR", "VkFlags"
  typealias "VkFenceImportFlags", "VkFlags"
  typealias "VkFenceImportFlagsKHR", "VkFlags"
  typealias "VkSurfaceCounterFlagsEXT", "VkFlags"
  typealias "VkPipelineViewportSwizzleStateCreateFlagsNV", "VkFlags"
  typealias "VkPipelineDiscardRectangleStateCreateFlagsEXT", "VkFlags"
  typealias "VkPipelineCoverageToColorStateCreateFlagsNV", "VkFlags"
  typealias "VkPipelineCoverageModulationStateCreateFlagsNV", "VkFlags"
  typealias "VkValidationCacheCreateFlagsEXT", "VkFlags"
  typealias "VkDebugUtilsMessageSeverityFlagsEXT", "VkFlags"
  typealias "VkDebugUtilsMessageTypeFlagsEXT", "VkFlags"
  typealias "VkDebugUtilsMessengerCreateFlagsEXT", "VkFlags"
  typealias "VkDebugUtilsMessengerCallbackDataFlagsEXT", "VkFlags"
  typealias "VkPipelineRasterizationConservativeStateCreateFlagsEXT", "VkFlags"
  typealias "VkDescriptorBindingFlagsEXT", "VkFlags"
  typealias "VkConditionalRenderingFlagsEXT", "VkFlags"
  typealias "VkPipelineRasterizationStateStreamCreateFlagsEXT", "VkFlags"
  typealias "VkInstance", "void *"
  typealias "VkPhysicalDevice", "void *"
  typealias "VkDevice", "void *"
  typealias "VkQueue", "void *"
  typealias "VkCommandBuffer", "void *"
  typealias "VkDeviceMemory", "void *"
  typealias "VkCommandPool", "void *"
  typealias "VkBuffer", "void *"
  typealias "VkBufferView", "void *"
  typealias "VkImage", "void *"
  typealias "VkImageView", "void *"
  typealias "VkShaderModule", "void *"
  typealias "VkPipeline", "void *"
  typealias "VkPipelineLayout", "void *"
  typealias "VkSampler", "void *"
  typealias "VkDescriptorSet", "void *"
  typealias "VkDescriptorSetLayout", "void *"
  typealias "VkDescriptorPool", "void *"
  typealias "VkFence", "void *"
  typealias "VkSemaphore", "void *"
  typealias "VkEvent", "void *"
  typealias "VkQueryPool", "void *"
  typealias "VkFramebuffer", "void *"
  typealias "VkRenderPass", "void *"
  typealias "VkPipelineCache", "void *"
  typealias "VkObjectTableNVX", "void *"
  typealias "VkIndirectCommandsLayoutNVX", "void *"
  typealias "VkDescriptorUpdateTemplate", "void *"
  typealias "VkDescriptorUpdateTemplateKHR", "void *"
  typealias "VkSamplerYcbcrConversion", "void *"
  typealias "VkSamplerYcbcrConversionKHR", "void *"
  typealias "VkValidationCacheEXT", "void *"
  typealias "VkAccelerationStructureNVX", "void *"
  typealias "VkDisplayKHR", "void *"
  typealias "VkDisplayModeKHR", "void *"
  typealias "VkSurfaceKHR", "void *"
  typealias "VkSwapchainKHR", "void *"
  typealias "VkDebugReportCallbackEXT", "void *"
  typealias "VkDebugUtilsMessengerEXT", "void *"
  typealias "PFN_vkInternalAllocationNotification", "void *"
  typealias "PFN_vkInternalFreeNotification", "void *"
  typealias "PFN_vkReallocationFunction", "void *"
  typealias "PFN_vkAllocationFunction", "void *"
  typealias "PFN_vkFreeFunction", "void *"
  typealias "PFN_vkVoidFunction", "void *"
  typealias "PFN_vkDebugReportCallbackEXT", "void *"
  typealias "PFN_vkDebugUtilsMessengerCallbackEXT", "void *"
end
