# vulkan-ruby 1.3.207.1
#
#   => https://github.com/sinisterchipmunk/vulkan-ruby
#
# [NOTICE] This is an automatically generated file.

module Vulkan
  VkAabbPositionsKHR = struct ["float  minX",
                               "float  minY",
                               "float  minZ",
                               "float  maxX",
                               "float  maxY",
                               "float  maxZ"]

  VkAabbPositionsNV = VkAabbPositionsKHR

  VkDeviceOrHostAddressConstKHR = union ["VkDeviceAddress  deviceAddress",
                                         "void * hostAddress"]
  VkAccelerationStructureGeometryTrianglesDataKHR = struct ["VkStructureType  sType",
                                                            "void * pNext",
                                                            "VkFormat  vertexFormat",
                                                            { "vertexData" => VkDeviceOrHostAddressConstKHR },
                                                            "VkDeviceSize  vertexStride",
                                                            "uint32_t  maxVertex",
                                                            "VkIndexType  indexType",
                                                            { "indexData" => VkDeviceOrHostAddressConstKHR },
                                                            { "transformData" => VkDeviceOrHostAddressConstKHR }]
  VkAccelerationStructureGeometryAabbsDataKHR = struct ["VkStructureType  sType",
                                                        "void * pNext",
                                                        { "data" => VkDeviceOrHostAddressConstKHR },
                                                        "VkDeviceSize  stride"]
  VkAccelerationStructureGeometryInstancesDataKHR = struct ["VkStructureType  sType",
                                                            "void * pNext",
                                                            "VkBool32  arrayOfPointers",
                                                            { "data" => VkDeviceOrHostAddressConstKHR }]
  VkAccelerationStructureGeometryDataKHR = union [{ "triangles" => VkAccelerationStructureGeometryTrianglesDataKHR },
                                                  { "aabbs" => VkAccelerationStructureGeometryAabbsDataKHR },
                                                  { "instances" => VkAccelerationStructureGeometryInstancesDataKHR }]
  VkAccelerationStructureGeometryKHR = struct ["VkStructureType  sType",
                                               "void * pNext",
                                               "VkGeometryTypeKHR  geometryType",
                                               { "geometry" => VkAccelerationStructureGeometryDataKHR },
                                               "VkGeometryFlagsKHR  flags"]
  VkDeviceOrHostAddressKHR = union ["VkDeviceAddress  deviceAddress",
                                    "void * hostAddress"]
  VkAccelerationStructureBuildGeometryInfoKHR = struct ["VkStructureType  sType",
                                                        "void * pNext",
                                                        "VkAccelerationStructureTypeKHR  type",
                                                        "VkBuildAccelerationStructureFlagsKHR  flags",
                                                        "VkBuildAccelerationStructureModeKHR  mode",
                                                        "VkAccelerationStructureKHR  srcAccelerationStructure",
                                                        "VkAccelerationStructureKHR  dstAccelerationStructure",
                                                        "uint32_t  geometryCount",
                                                        "VkAccelerationStructureGeometryKHR * pGeometries",
                                                        "VkAccelerationStructureGeometryKHR * ppGeometries",
                                                        { "scratchData" => VkDeviceOrHostAddressKHR }]

  VkAccelerationStructureBuildRangeInfoKHR = struct ["uint32_t  primitiveCount",
                                                     "uint32_t  primitiveOffset",
                                                     "uint32_t  firstVertex",
                                                     "uint32_t  transformOffset"]

  VkAccelerationStructureBuildSizesInfoKHR = struct ["VkStructureType  sType",
                                                     "void * pNext",
                                                     "VkDeviceSize  accelerationStructureSize",
                                                     "VkDeviceSize  updateScratchSize",
                                                     "VkDeviceSize  buildScratchSize"]

  VkAccelerationStructureCreateInfoKHR = struct ["VkStructureType  sType",
                                                 "void * pNext",
                                                 "VkAccelerationStructureCreateFlagsKHR  createFlags",
                                                 "VkBuffer  buffer",
                                                 "VkDeviceSize  offset",
                                                 "VkDeviceSize  size",
                                                 "VkAccelerationStructureTypeKHR  type",
                                                 "VkDeviceAddress  deviceAddress"]

  VkGeometryTrianglesNV = struct ["VkStructureType  sType",
                                  "void * pNext",
                                  "VkBuffer  vertexData",
                                  "VkDeviceSize  vertexOffset",
                                  "uint32_t  vertexCount",
                                  "VkDeviceSize  vertexStride",
                                  "VkFormat  vertexFormat",
                                  "VkBuffer  indexData",
                                  "VkDeviceSize  indexOffset",
                                  "uint32_t  indexCount",
                                  "VkIndexType  indexType",
                                  "VkBuffer  transformData",
                                  "VkDeviceSize  transformOffset"]
  VkGeometryAABBNV = struct ["VkStructureType  sType",
                             "void * pNext",
                             "VkBuffer  aabbData",
                             "uint32_t  numAABBs",
                             "uint32_t  stride",
                             "VkDeviceSize  offset"]
  VkGeometryDataNV = struct [{ "triangles" => VkGeometryTrianglesNV },
                             { "aabbs" => VkGeometryAABBNV }]
  VkGeometryNV = struct ["VkStructureType  sType",
                         "void * pNext",
                         "VkGeometryTypeKHR  geometryType",
                         { "geometry" => VkGeometryDataNV },
                         "VkGeometryFlagsKHR  flags"]
  VkAccelerationStructureInfoNV = struct ["VkStructureType  sType",
                                          "void * pNext",
                                          "VkAccelerationStructureTypeNV  type",
                                          "VkBuildAccelerationStructureFlagsNV  flags",
                                          "uint32_t  instanceCount",
                                          "uint32_t  geometryCount",
                                          "VkGeometryNV * pGeometries"]
  VkAccelerationStructureCreateInfoNV = struct ["VkStructureType  sType",
                                                "void * pNext",
                                                "VkDeviceSize  compactedSize",
                                                { "info" => VkAccelerationStructureInfoNV }]

  VkAccelerationStructureDeviceAddressInfoKHR = struct ["VkStructureType  sType",
                                                        "void * pNext",
                                                        "VkAccelerationStructureKHR  accelerationStructure"]

  VkAccelerationStructureGeometryMotionTrianglesDataNV = struct ["VkStructureType  sType",
                                                                 "void * pNext",
                                                                 { "vertexData" => VkDeviceOrHostAddressConstKHR }]

  VkTransformMatrixKHR = struct ["float  matrix [4]"]
  VkAccelerationStructureInstanceKHR = struct [{ "transform" => VkTransformMatrixKHR },
                                               "uint32_t  instanceCustomIndex",
                                               "uint32_t  mask",
                                               "uint32_t  instanceShaderBindingTableRecordOffset",
                                               "VkGeometryInstanceFlagsKHR  flags",
                                               "uint64_t  accelerationStructureReference"]

  VkAccelerationStructureInstanceNV = VkAccelerationStructureInstanceKHR

  VkAccelerationStructureMatrixMotionInstanceNV = struct [{ "transformT0" => VkTransformMatrixKHR },
                                                          { "transformT1" => VkTransformMatrixKHR },
                                                          "uint32_t  instanceCustomIndex",
                                                          "uint32_t  mask",
                                                          "uint32_t  instanceShaderBindingTableRecordOffset",
                                                          "VkGeometryInstanceFlagsKHR  flags",
                                                          "uint64_t  accelerationStructureReference"]

  VkAccelerationStructureMemoryRequirementsInfoNV = struct ["VkStructureType  sType",
                                                            "void * pNext",
                                                            "VkAccelerationStructureMemoryRequirementsTypeNV  type",
                                                            "VkAccelerationStructureNV  accelerationStructure"]

  VkAccelerationStructureMotionInfoNV = struct ["VkStructureType  sType",
                                                "void * pNext",
                                                "uint32_t  maxInstances",
                                                "VkAccelerationStructureMotionInfoFlagsNV  flags"]

  VkSRTDataNV = struct ["float  sx",
                        "float  a",
                        "float  b",
                        "float  pvx",
                        "float  sy",
                        "float  c",
                        "float  pvy",
                        "float  sz",
                        "float  pvz",
                        "float  qx",
                        "float  qy",
                        "float  qz",
                        "float  qw",
                        "float  tx",
                        "float  ty",
                        "float  tz"]
  VkAccelerationStructureSRTMotionInstanceNV = struct [{ "transformT0" => VkSRTDataNV },
                                                       { "transformT1" => VkSRTDataNV },
                                                       "uint32_t  instanceCustomIndex",
                                                       "uint32_t  mask",
                                                       "uint32_t  instanceShaderBindingTableRecordOffset",
                                                       "VkGeometryInstanceFlagsKHR  flags",
                                                       "uint64_t  accelerationStructureReference"]
  VkAccelerationStructureMotionInstanceDataNV = union [{ "staticInstance" => VkAccelerationStructureInstanceKHR },
                                                       { "matrixMotionInstance" => VkAccelerationStructureMatrixMotionInstanceNV },
                                                       { "srtMotionInstance" => VkAccelerationStructureSRTMotionInstanceNV }]

  VkAccelerationStructureMotionInstanceNV = struct ["VkAccelerationStructureMotionInstanceTypeNV  type",
                                                    "VkAccelerationStructureMotionInstanceFlagsNV  flags",
                                                    { "data" => VkAccelerationStructureMotionInstanceDataNV }]

  VkAccelerationStructureVersionInfoKHR = struct ["VkStructureType  sType",
                                                  "void * pNext",
                                                  "uint8_t * pVersionData"]

  VkAcquireNextImageInfoKHR = struct ["VkStructureType  sType",
                                      "void * pNext",
                                      "VkSwapchainKHR  swapchain",
                                      "uint64_t  timeout",
                                      "VkSemaphore  semaphore",
                                      "VkFence  fence",
                                      "uint32_t  deviceMask"]

  VkAcquireProfilingLockInfoKHR = struct ["VkStructureType  sType",
                                          "void * pNext",
                                          "VkAcquireProfilingLockFlagsKHR  flags",
                                          "uint64_t  timeout"]

  VkAllocationCallbacks = struct ["void * pUserData",
                                  "PFN_vkAllocationFunction  pfnAllocation",
                                  "PFN_vkReallocationFunction  pfnReallocation",
                                  "PFN_vkFreeFunction  pfnFree",
                                  "PFN_vkInternalAllocationNotification  pfnInternalAllocation",
                                  "PFN_vkInternalFreeNotification  pfnInternalFree"]

  VkComponentMapping = struct ["VkComponentSwizzle  r",
                               "VkComponentSwizzle  g",
                               "VkComponentSwizzle  b",
                               "VkComponentSwizzle  a"]
  VkAndroidHardwareBufferFormatProperties2ANDROID = struct ["VkStructureType  sType",
                                                            "void * pNext",
                                                            "VkFormat  format",
                                                            "uint64_t  externalFormat",
                                                            "VkFormatFeatureFlags2  formatFeatures",
                                                            { "samplerYcbcrConversionComponents" => VkComponentMapping },
                                                            "VkSamplerYcbcrModelConversion  suggestedYcbcrModel",
                                                            "VkSamplerYcbcrRange  suggestedYcbcrRange",
                                                            "VkChromaLocation  suggestedXChromaOffset",
                                                            "VkChromaLocation  suggestedYChromaOffset"]

  VkAndroidHardwareBufferFormatPropertiesANDROID = struct ["VkStructureType  sType",
                                                           "void * pNext",
                                                           "VkFormat  format",
                                                           "uint64_t  externalFormat",
                                                           "VkFormatFeatureFlags  formatFeatures",
                                                           { "samplerYcbcrConversionComponents" => VkComponentMapping },
                                                           "VkSamplerYcbcrModelConversion  suggestedYcbcrModel",
                                                           "VkSamplerYcbcrRange  suggestedYcbcrRange",
                                                           "VkChromaLocation  suggestedXChromaOffset",
                                                           "VkChromaLocation  suggestedYChromaOffset"]

  VkAndroidHardwareBufferPropertiesANDROID = struct ["VkStructureType  sType",
                                                     "void * pNext",
                                                     "VkDeviceSize  allocationSize",
                                                     "uint32_t  memoryTypeBits"]

  VkAndroidHardwareBufferUsageANDROID = struct ["VkStructureType  sType",
                                                "void * pNext",
                                                "uint64_t  androidHardwareBufferUsage"]

  VkAndroidSurfaceCreateInfoKHR = struct ["VkStructureType  sType",
                                          "void * pNext",
                                          "VkAndroidSurfaceCreateFlagsKHR  flags",
                                          "ANativeWindow * window"]

  VkApplicationInfo = struct ["VkStructureType  sType",
                              "void * pNext",
                              "char * pApplicationName",
                              "uint32_t  applicationVersion",
                              "char * pEngineName",
                              "uint32_t  engineVersion",
                              "uint32_t  apiVersion"]

  VkAttachmentDescription = struct ["VkAttachmentDescriptionFlags  flags",
                                    "VkFormat  format",
                                    "VkSampleCountFlagBits  samples",
                                    "VkAttachmentLoadOp  loadOp",
                                    "VkAttachmentStoreOp  storeOp",
                                    "VkAttachmentLoadOp  stencilLoadOp",
                                    "VkAttachmentStoreOp  stencilStoreOp",
                                    "VkImageLayout  initialLayout",
                                    "VkImageLayout  finalLayout"]

  VkAttachmentDescription2 = struct ["VkStructureType  sType",
                                     "void * pNext",
                                     "VkAttachmentDescriptionFlags  flags",
                                     "VkFormat  format",
                                     "VkSampleCountFlagBits  samples",
                                     "VkAttachmentLoadOp  loadOp",
                                     "VkAttachmentStoreOp  storeOp",
                                     "VkAttachmentLoadOp  stencilLoadOp",
                                     "VkAttachmentStoreOp  stencilStoreOp",
                                     "VkImageLayout  initialLayout",
                                     "VkImageLayout  finalLayout"]

  VkAttachmentDescription2KHR = VkAttachmentDescription2

  VkAttachmentDescriptionStencilLayout = struct ["VkStructureType  sType",
                                                 "void * pNext",
                                                 "VkImageLayout  stencilInitialLayout",
                                                 "VkImageLayout  stencilFinalLayout"]

  VkAttachmentDescriptionStencilLayoutKHR = VkAttachmentDescriptionStencilLayout

  VkAttachmentReference = struct ["uint32_t  attachment",
                                  "VkImageLayout  layout"]

  VkAttachmentReference2 = struct ["VkStructureType  sType",
                                   "void * pNext",
                                   "uint32_t  attachment",
                                   "VkImageLayout  layout",
                                   "VkImageAspectFlags  aspectMask"]

  VkAttachmentReference2KHR = VkAttachmentReference2

  VkAttachmentReferenceStencilLayout = struct ["VkStructureType  sType",
                                               "void * pNext",
                                               "VkImageLayout  stencilLayout"]

  VkAttachmentReferenceStencilLayoutKHR = VkAttachmentReferenceStencilLayout

  VkAttachmentSampleCountInfoAMD = struct ["VkStructureType  sType",
                                           "void * pNext",
                                           "uint32_t  colorAttachmentCount",
                                           "VkSampleCountFlagBits * pColorAttachmentSamples",
                                           "VkSampleCountFlagBits  depthStencilAttachmentSamples"]

  VkAttachmentSampleCountInfoNV = VkAttachmentSampleCountInfoAMD

  VkExtent2D = struct ["uint32_t  width",
                       "uint32_t  height"]
  VkSampleLocationEXT = struct ["float  x",
                                "float  y"]
  VkSampleLocationsInfoEXT = struct ["VkStructureType  sType",
                                     "void * pNext",
                                     "VkSampleCountFlagBits  sampleLocationsPerPixel",
                                     { "sampleLocationGridSize" => VkExtent2D },
                                     "uint32_t  sampleLocationsCount",
                                     "VkSampleLocationEXT * pSampleLocations"]
  VkAttachmentSampleLocationsEXT = struct ["uint32_t  attachmentIndex",
                                           { "sampleLocationsInfo" => VkSampleLocationsInfoEXT }]

  VkBaseInStructure = struct ["VkStructureType  sType",
                              "VkBaseInStructure * pNext"]

  VkBaseOutStructure = struct ["VkStructureType  sType",
                               "VkBaseOutStructure * pNext"]

  VkBindAccelerationStructureMemoryInfoNV = struct ["VkStructureType  sType",
                                                    "void * pNext",
                                                    "VkAccelerationStructureNV  accelerationStructure",
                                                    "VkDeviceMemory  memory",
                                                    "VkDeviceSize  memoryOffset",
                                                    "uint32_t  deviceIndexCount",
                                                    "uint32_t * pDeviceIndices"]

  VkBindBufferMemoryDeviceGroupInfo = struct ["VkStructureType  sType",
                                              "void * pNext",
                                              "uint32_t  deviceIndexCount",
                                              "uint32_t * pDeviceIndices"]

  VkBindBufferMemoryDeviceGroupInfoKHR = VkBindBufferMemoryDeviceGroupInfo

  VkBindBufferMemoryInfo = struct ["VkStructureType  sType",
                                   "void * pNext",
                                   "VkBuffer  buffer",
                                   "VkDeviceMemory  memory",
                                   "VkDeviceSize  memoryOffset"]

  VkBindBufferMemoryInfoKHR = VkBindBufferMemoryInfo

  VkOffset2D = struct ["int32_t  x",
                       "int32_t  y"]
  VkRect2D = struct [{ "offset" => VkOffset2D },
                     { "extent" => VkExtent2D }]
  VkBindImageMemoryDeviceGroupInfo = struct ["VkStructureType  sType",
                                             "void * pNext",
                                             "uint32_t  deviceIndexCount",
                                             "uint32_t * pDeviceIndices",
                                             "uint32_t  splitInstanceBindRegionCount",
                                             "VkRect2D * pSplitInstanceBindRegions"]

  VkBindImageMemoryDeviceGroupInfoKHR = VkBindImageMemoryDeviceGroupInfo

  VkBindImageMemoryInfo = struct ["VkStructureType  sType",
                                  "void * pNext",
                                  "VkImage  image",
                                  "VkDeviceMemory  memory",
                                  "VkDeviceSize  memoryOffset"]

  VkBindImageMemoryInfoKHR = VkBindImageMemoryInfo

  VkBindImageMemorySwapchainInfoKHR = struct ["VkStructureType  sType",
                                              "void * pNext",
                                              "VkSwapchainKHR  swapchain",
                                              "uint32_t  imageIndex"]

  VkBindImagePlaneMemoryInfo = struct ["VkStructureType  sType",
                                       "void * pNext",
                                       "VkImageAspectFlagBits  planeAspect"]

  VkBindImagePlaneMemoryInfoKHR = VkBindImagePlaneMemoryInfo

  VkBindIndexBufferIndirectCommandNV = struct ["VkDeviceAddress  bufferAddress",
                                               "uint32_t  size",
                                               "VkIndexType  indexType"]

  VkBindShaderGroupIndirectCommandNV = struct ["uint32_t  groupIndex"]

  VkSparseMemoryBind = struct ["VkDeviceSize  resourceOffset",
                               "VkDeviceSize  size",
                               "VkDeviceMemory  memory",
                               "VkDeviceSize  memoryOffset",
                               "VkSparseMemoryBindFlags  flags"]
  VkSparseBufferMemoryBindInfo = struct ["VkBuffer  buffer",
                                         "uint32_t  bindCount",
                                         "VkSparseMemoryBind * pBinds"]
  VkSparseImageOpaqueMemoryBindInfo = struct ["VkImage  image",
                                              "uint32_t  bindCount",
                                              "VkSparseMemoryBind * pBinds"]
  VkImageSubresource = struct ["VkImageAspectFlags  aspectMask",
                               "uint32_t  mipLevel",
                               "uint32_t  arrayLayer"]
  VkOffset3D = struct ["int32_t  x",
                       "int32_t  y",
                       "int32_t  z"]
  VkExtent3D = struct ["uint32_t  width",
                       "uint32_t  height",
                       "uint32_t  depth"]
  VkSparseImageMemoryBind = struct [{ "subresource" => VkImageSubresource },
                                    { "offset" => VkOffset3D },
                                    { "extent" => VkExtent3D },
                                    "VkDeviceMemory  memory",
                                    "VkDeviceSize  memoryOffset",
                                    "VkSparseMemoryBindFlags  flags"]
  VkSparseImageMemoryBindInfo = struct ["VkImage  image",
                                        "uint32_t  bindCount",
                                        "VkSparseImageMemoryBind * pBinds"]
  VkBindSparseInfo = struct ["VkStructureType  sType",
                             "void * pNext",
                             "uint32_t  waitSemaphoreCount",
                             "VkSemaphore * pWaitSemaphores",
                             "uint32_t  bufferBindCount",
                             "VkSparseBufferMemoryBindInfo * pBufferBinds",
                             "uint32_t  imageOpaqueBindCount",
                             "VkSparseImageOpaqueMemoryBindInfo * pImageOpaqueBinds",
                             "uint32_t  imageBindCount",
                             "VkSparseImageMemoryBindInfo * pImageBinds",
                             "uint32_t  signalSemaphoreCount",
                             "VkSemaphore * pSignalSemaphores"]

  VkBindVertexBufferIndirectCommandNV = struct ["VkDeviceAddress  bufferAddress",
                                                "uint32_t  size",
                                                "uint32_t  stride"]

  VkImageSubresourceLayers = struct ["VkImageAspectFlags  aspectMask",
                                     "uint32_t  mipLevel",
                                     "uint32_t  baseArrayLayer",
                                     "uint32_t  layerCount"]
  VkImageBlit2 = struct ["VkStructureType  sType",
                         "void * pNext",
                         { "srcSubresource" => VkImageSubresourceLayers },
                         { "srcOffsets[2]" => VkOffset3D },
                         { "dstSubresource" => VkImageSubresourceLayers },
                         { "dstOffsets[2]" => VkOffset3D }]
  VkBlitImageInfo2 = struct ["VkStructureType  sType",
                             "void * pNext",
                             "VkImage  srcImage",
                             "VkImageLayout  srcImageLayout",
                             "VkImage  dstImage",
                             "VkImageLayout  dstImageLayout",
                             "uint32_t  regionCount",
                             "VkImageBlit2 * pRegions",
                             "VkFilter  filter"]

  VkBlitImageInfo2KHR = VkBlitImageInfo2

  VkBufferCollectionBufferCreateInfoFUCHSIA = struct ["VkStructureType  sType",
                                                      "void * pNext",
                                                      "VkBufferCollectionFUCHSIA  collection",
                                                      "uint32_t  index"]

  VkBufferCollectionConstraintsInfoFUCHSIA = struct ["VkStructureType  sType",
                                                     "void * pNext",
                                                     "uint32_t  minBufferCount",
                                                     "uint32_t  maxBufferCount",
                                                     "uint32_t  minBufferCountForCamping",
                                                     "uint32_t  minBufferCountForDedicatedSlack",
                                                     "uint32_t  minBufferCountForSharedSlack"]

  VkBufferCollectionCreateInfoFUCHSIA = struct ["VkStructureType  sType",
                                                "void * pNext",
                                                "zx_handle_t  collectionToken"]

  VkBufferCollectionImageCreateInfoFUCHSIA = struct ["VkStructureType  sType",
                                                     "void * pNext",
                                                     "VkBufferCollectionFUCHSIA  collection",
                                                     "uint32_t  index"]

  VkSysmemColorSpaceFUCHSIA = struct ["VkStructureType  sType",
                                      "void * pNext",
                                      "uint32_t  colorSpace"]
  VkBufferCollectionPropertiesFUCHSIA = struct ["VkStructureType  sType",
                                                "void * pNext",
                                                "uint32_t  memoryTypeBits",
                                                "uint32_t  bufferCount",
                                                "uint32_t  createInfoIndex",
                                                "uint64_t  sysmemPixelFormat",
                                                "VkFormatFeatureFlags  formatFeatures",
                                                { "sysmemColorSpaceIndex" => VkSysmemColorSpaceFUCHSIA },
                                                { "samplerYcbcrConversionComponents" => VkComponentMapping },
                                                "VkSamplerYcbcrModelConversion  suggestedYcbcrModel",
                                                "VkSamplerYcbcrRange  suggestedYcbcrRange",
                                                "VkChromaLocation  suggestedXChromaOffset",
                                                "VkChromaLocation  suggestedYChromaOffset"]

  VkBufferCreateInfo = struct ["VkStructureType  sType",
                               "void * pNext",
                               "VkBufferCreateFlags  flags",
                               "VkDeviceSize  size",
                               "VkBufferUsageFlags  usage",
                               "VkSharingMode  sharingMode",
                               "uint32_t  queueFamilyIndexCount",
                               "uint32_t * pQueueFamilyIndices"]
  VkBufferConstraintsInfoFUCHSIA = struct ["VkStructureType  sType",
                                           "void * pNext",
                                           { "createInfo" => VkBufferCreateInfo },
                                           "VkFormatFeatureFlags  requiredFormatFeatures",
                                           { "bufferCollectionConstraints" => VkBufferCollectionConstraintsInfoFUCHSIA }]

  VkBufferCopy = struct ["VkDeviceSize  srcOffset",
                         "VkDeviceSize  dstOffset",
                         "VkDeviceSize  size"]

  VkBufferCopy2 = struct ["VkStructureType  sType",
                          "void * pNext",
                          "VkDeviceSize  srcOffset",
                          "VkDeviceSize  dstOffset",
                          "VkDeviceSize  size"]

  VkBufferCopy2KHR = VkBufferCopy2

  VkBufferDeviceAddressCreateInfoEXT = struct ["VkStructureType  sType",
                                               "void * pNext",
                                               "VkDeviceAddress  deviceAddress"]

  VkBufferDeviceAddressInfo = struct ["VkStructureType  sType",
                                      "void * pNext",
                                      "VkBuffer  buffer"]

  VkBufferDeviceAddressInfoEXT = VkBufferDeviceAddressInfo

  VkBufferDeviceAddressInfoKHR = VkBufferDeviceAddressInfo

  VkBufferImageCopy = struct ["VkDeviceSize  bufferOffset",
                              "uint32_t  bufferRowLength",
                              "uint32_t  bufferImageHeight",
                              { "imageSubresource" => VkImageSubresourceLayers },
                              { "imageOffset" => VkOffset3D },
                              { "imageExtent" => VkExtent3D }]

  VkBufferImageCopy2 = struct ["VkStructureType  sType",
                               "void * pNext",
                               "VkDeviceSize  bufferOffset",
                               "uint32_t  bufferRowLength",
                               "uint32_t  bufferImageHeight",
                               { "imageSubresource" => VkImageSubresourceLayers },
                               { "imageOffset" => VkOffset3D },
                               { "imageExtent" => VkExtent3D }]

  VkBufferImageCopy2KHR = VkBufferImageCopy2

  VkBufferMemoryBarrier = struct ["VkStructureType  sType",
                                  "void * pNext",
                                  "VkAccessFlags  srcAccessMask",
                                  "VkAccessFlags  dstAccessMask",
                                  "uint32_t  srcQueueFamilyIndex",
                                  "uint32_t  dstQueueFamilyIndex",
                                  "VkBuffer  buffer",
                                  "VkDeviceSize  offset",
                                  "VkDeviceSize  size"]

  VkBufferMemoryBarrier2 = struct ["VkStructureType  sType",
                                   "void * pNext",
                                   "VkPipelineStageFlags2  srcStageMask",
                                   "VkAccessFlags2  srcAccessMask",
                                   "VkPipelineStageFlags2  dstStageMask",
                                   "VkAccessFlags2  dstAccessMask",
                                   "uint32_t  srcQueueFamilyIndex",
                                   "uint32_t  dstQueueFamilyIndex",
                                   "VkBuffer  buffer",
                                   "VkDeviceSize  offset",
                                   "VkDeviceSize  size"]

  VkBufferMemoryBarrier2KHR = VkBufferMemoryBarrier2

  VkBufferMemoryRequirementsInfo2 = struct ["VkStructureType  sType",
                                            "void * pNext",
                                            "VkBuffer  buffer"]

  VkBufferMemoryRequirementsInfo2KHR = VkBufferMemoryRequirementsInfo2

  VkBufferOpaqueCaptureAddressCreateInfo = struct ["VkStructureType  sType",
                                                   "void * pNext",
                                                   "uint64_t  opaqueCaptureAddress"]

  VkBufferOpaqueCaptureAddressCreateInfoKHR = VkBufferOpaqueCaptureAddressCreateInfo

  VkBufferViewCreateInfo = struct ["VkStructureType  sType",
                                   "void * pNext",
                                   "VkBufferViewCreateFlags  flags",
                                   "VkBuffer  buffer",
                                   "VkFormat  format",
                                   "VkDeviceSize  offset",
                                   "VkDeviceSize  range"]

  VkCalibratedTimestampInfoEXT = struct ["VkStructureType  sType",
                                         "void * pNext",
                                         "VkTimeDomainEXT  timeDomain"]

  VkCheckpointData2NV = struct ["VkStructureType  sType",
                                "void * pNext",
                                "VkPipelineStageFlags2  stage",
                                "void * pCheckpointMarker"]

  VkCheckpointDataNV = struct ["VkStructureType  sType",
                               "void * pNext",
                               "VkPipelineStageFlagBits  stage",
                               "void * pCheckpointMarker"]

  # Union allowing specification of floating point, integer, or unsigned integer color data. Actual value selected is based on image/attachment being cleared.
  VkClearColorValue = union ["float  float32 [4]",
                             "int32_t  int32 [4]",
                             "uint32_t  uint32 [4]"]
  VkClearDepthStencilValue = struct ["float  depth",
                                     "uint32_t  stencil"]
  # Union allowing specification of color or depth and stencil values. Actual value selected is based on attachment being cleared.
  VkClearValue = union [{ "color" => VkClearColorValue },
                        { "depthStencil" => VkClearDepthStencilValue }]
  VkClearAttachment = struct ["VkImageAspectFlags  aspectMask",
                              "uint32_t  colorAttachment",
                              { "clearValue" => VkClearValue }]

  VkClearRect = struct [{ "rect" => VkRect2D },
                        "uint32_t  baseArrayLayer",
                        "uint32_t  layerCount"]

  VkCoarseSampleLocationNV = struct ["uint32_t  pixelX",
                                     "uint32_t  pixelY",
                                     "uint32_t  sample"]

  VkCoarseSampleOrderCustomNV = struct ["VkShadingRatePaletteEntryNV  shadingRate",
                                        "uint32_t  sampleCount",
                                        "uint32_t  sampleLocationCount",
                                        "VkCoarseSampleLocationNV * pSampleLocations"]

  VkCommandBufferAllocateInfo = struct ["VkStructureType  sType",
                                        "void * pNext",
                                        "VkCommandPool  commandPool",
                                        "VkCommandBufferLevel  level",
                                        "uint32_t  commandBufferCount"]

  VkCommandBufferInheritanceInfo = struct ["VkStructureType  sType",
                                           "void * pNext",
                                           "VkRenderPass  renderPass",
                                           "uint32_t  subpass",
                                           "VkFramebuffer  framebuffer",
                                           "VkBool32  occlusionQueryEnable",
                                           "VkQueryControlFlags  queryFlags",
                                           "VkQueryPipelineStatisticFlags  pipelineStatistics"]
  VkCommandBufferBeginInfo = struct ["VkStructureType  sType",
                                     "void * pNext",
                                     "VkCommandBufferUsageFlags  flags",
                                     "VkCommandBufferInheritanceInfo * pInheritanceInfo"]

  VkCommandBufferInheritanceConditionalRenderingInfoEXT = struct ["VkStructureType  sType",
                                                                  "void * pNext",
                                                                  "VkBool32  conditionalRenderingEnable"]

  VkCommandBufferInheritanceRenderPassTransformInfoQCOM = struct ["VkStructureType  sType",
                                                                  "void * pNext",
                                                                  "VkSurfaceTransformFlagBitsKHR  transform",
                                                                  { "renderArea" => VkRect2D }]

  VkCommandBufferInheritanceRenderingInfo = struct ["VkStructureType  sType",
                                                    "void * pNext",
                                                    "VkRenderingFlags  flags",
                                                    "uint32_t  viewMask",
                                                    "uint32_t  colorAttachmentCount",
                                                    "VkFormat * pColorAttachmentFormats",
                                                    "VkFormat  depthAttachmentFormat",
                                                    "VkFormat  stencilAttachmentFormat",
                                                    "VkSampleCountFlagBits  rasterizationSamples"]

  VkCommandBufferInheritanceRenderingInfoKHR = VkCommandBufferInheritanceRenderingInfo

  VkViewport = struct ["float  x",
                       "float  y",
                       "float  width",
                       "float  height",
                       "float  minDepth",
                       "float  maxDepth"]
  VkCommandBufferInheritanceViewportScissorInfoNV = struct ["VkStructureType  sType",
                                                            "void * pNext",
                                                            "VkBool32  viewportScissor2D",
                                                            "uint32_t  viewportDepthCount",
                                                            "VkViewport * pViewportDepths"]

  VkCommandBufferSubmitInfo = struct ["VkStructureType  sType",
                                      "void * pNext",
                                      "VkCommandBuffer  commandBuffer",
                                      "uint32_t  deviceMask"]

  VkCommandBufferSubmitInfoKHR = VkCommandBufferSubmitInfo

  VkCommandPoolCreateInfo = struct ["VkStructureType  sType",
                                    "void * pNext",
                                    "VkCommandPoolCreateFlags  flags",
                                    "uint32_t  queueFamilyIndex"]

  VkSpecializationMapEntry = struct ["uint32_t  constantID",
                                     "uint32_t  offset",
                                     "size_t  size"]
  VkSpecializationInfo = struct ["uint32_t  mapEntryCount",
                                 "VkSpecializationMapEntry * pMapEntries",
                                 "size_t  dataSize",
                                 "void * pData"]
  VkPipelineShaderStageCreateInfo = struct ["VkStructureType  sType",
                                            "void * pNext",
                                            "VkPipelineShaderStageCreateFlags  flags",
                                            "VkShaderStageFlagBits  stage",
                                            "VkShaderModule  module",
                                            "char * pName",
                                            "VkSpecializationInfo * pSpecializationInfo"]
  VkComputePipelineCreateInfo = struct ["VkStructureType  sType",
                                        "void * pNext",
                                        "VkPipelineCreateFlags  flags",
                                        { "stage" => VkPipelineShaderStageCreateInfo },
                                        "VkPipelineLayout  layout",
                                        "VkPipeline  basePipelineHandle",
                                        "int32_t  basePipelineIndex"]

  VkConditionalRenderingBeginInfoEXT = struct ["VkStructureType  sType",
                                               "void * pNext",
                                               "VkBuffer  buffer",
                                               "VkDeviceSize  offset",
                                               "VkConditionalRenderingFlagsEXT  flags"]

  VkConformanceVersion = struct ["uint8_t  major",
                                 "uint8_t  minor",
                                 "uint8_t  subminor",
                                 "uint8_t  patch"]

  VkConformanceVersionKHR = VkConformanceVersion

  VkCooperativeMatrixPropertiesNV = struct ["VkStructureType  sType",
                                            "void * pNext",
                                            "uint32_t  MSize",
                                            "uint32_t  NSize",
                                            "uint32_t  KSize",
                                            "VkComponentTypeNV  AType",
                                            "VkComponentTypeNV  BType",
                                            "VkComponentTypeNV  CType",
                                            "VkComponentTypeNV  DType",
                                            "VkScopeNV  scope"]

  VkCopyAccelerationStructureInfoKHR = struct ["VkStructureType  sType",
                                               "void * pNext",
                                               "VkAccelerationStructureKHR  src",
                                               "VkAccelerationStructureKHR  dst",
                                               "VkCopyAccelerationStructureModeKHR  mode"]

  VkCopyAccelerationStructureToMemoryInfoKHR = struct ["VkStructureType  sType",
                                                       "void * pNext",
                                                       "VkAccelerationStructureKHR  src",
                                                       { "dst" => VkDeviceOrHostAddressKHR },
                                                       "VkCopyAccelerationStructureModeKHR  mode"]

  VkCopyBufferInfo2 = struct ["VkStructureType  sType",
                              "void * pNext",
                              "VkBuffer  srcBuffer",
                              "VkBuffer  dstBuffer",
                              "uint32_t  regionCount",
                              "VkBufferCopy2 * pRegions"]

  VkCopyBufferInfo2KHR = VkCopyBufferInfo2

  VkCopyBufferToImageInfo2 = struct ["VkStructureType  sType",
                                     "void * pNext",
                                     "VkBuffer  srcBuffer",
                                     "VkImage  dstImage",
                                     "VkImageLayout  dstImageLayout",
                                     "uint32_t  regionCount",
                                     "VkBufferImageCopy2 * pRegions"]

  VkCopyBufferToImageInfo2KHR = VkCopyBufferToImageInfo2

  VkCopyCommandTransformInfoQCOM = struct ["VkStructureType  sType",
                                           "void * pNext",
                                           "VkSurfaceTransformFlagBitsKHR  transform"]

  VkCopyDescriptorSet = struct ["VkStructureType  sType",
                                "void * pNext",
                                "VkDescriptorSet  srcSet",
                                "uint32_t  srcBinding",
                                "uint32_t  srcArrayElement",
                                "VkDescriptorSet  dstSet",
                                "uint32_t  dstBinding",
                                "uint32_t  dstArrayElement",
                                "uint32_t  descriptorCount"]

  VkImageCopy2 = struct ["VkStructureType  sType",
                         "void * pNext",
                         { "srcSubresource" => VkImageSubresourceLayers },
                         { "srcOffset" => VkOffset3D },
                         { "dstSubresource" => VkImageSubresourceLayers },
                         { "dstOffset" => VkOffset3D },
                         { "extent" => VkExtent3D }]
  VkCopyImageInfo2 = struct ["VkStructureType  sType",
                             "void * pNext",
                             "VkImage  srcImage",
                             "VkImageLayout  srcImageLayout",
                             "VkImage  dstImage",
                             "VkImageLayout  dstImageLayout",
                             "uint32_t  regionCount",
                             "VkImageCopy2 * pRegions"]

  VkCopyImageInfo2KHR = VkCopyImageInfo2

  VkCopyImageToBufferInfo2 = struct ["VkStructureType  sType",
                                     "void * pNext",
                                     "VkImage  srcImage",
                                     "VkImageLayout  srcImageLayout",
                                     "VkBuffer  dstBuffer",
                                     "uint32_t  regionCount",
                                     "VkBufferImageCopy2 * pRegions"]

  VkCopyImageToBufferInfo2KHR = VkCopyImageToBufferInfo2

  VkCopyMemoryToAccelerationStructureInfoKHR = struct ["VkStructureType  sType",
                                                       "void * pNext",
                                                       { "src" => VkDeviceOrHostAddressConstKHR },
                                                       "VkAccelerationStructureKHR  dst",
                                                       "VkCopyAccelerationStructureModeKHR  mode"]

  VkCuFunctionCreateInfoNVX = struct ["VkStructureType  sType",
                                      "void * pNext",
                                      "VkCuModuleNVX  module",
                                      "char * pName"]

  VkCuLaunchInfoNVX = struct ["VkStructureType  sType",
                              "void * pNext",
                              "VkCuFunctionNVX  function",
                              "uint32_t  gridDimX",
                              "uint32_t  gridDimY",
                              "uint32_t  gridDimZ",
                              "uint32_t  blockDimX",
                              "uint32_t  blockDimY",
                              "uint32_t  blockDimZ",
                              "uint32_t  sharedMemBytes",
                              "size_t  paramCount",
                              "void * pParams",
                              "size_t  extraCount",
                              "void * pExtras"]

  VkCuModuleCreateInfoNVX = struct ["VkStructureType  sType",
                                    "void * pNext",
                                    "size_t  dataSize",
                                    "void * pData"]

  VkD3D12FenceSubmitInfoKHR = struct ["VkStructureType  sType",
                                      "void * pNext",
                                      "uint32_t  waitSemaphoreValuesCount",
                                      "uint64_t * pWaitSemaphoreValues",
                                      "uint32_t  signalSemaphoreValuesCount",
                                      "uint64_t * pSignalSemaphoreValues"]

  VkDebugMarkerMarkerInfoEXT = struct ["VkStructureType  sType",
                                       "void * pNext",
                                       "char * pMarkerName",
                                       "float  color [4]"]

  VkDebugMarkerObjectNameInfoEXT = struct ["VkStructureType  sType",
                                           "void * pNext",
                                           "VkDebugReportObjectTypeEXT  objectType",
                                           "uint64_t  object",
                                           "char * pObjectName"]

  VkDebugMarkerObjectTagInfoEXT = struct ["VkStructureType  sType",
                                          "void * pNext",
                                          "VkDebugReportObjectTypeEXT  objectType",
                                          "uint64_t  object",
                                          "uint64_t  tagName",
                                          "size_t  tagSize",
                                          "void * pTag"]

  VkDebugReportCallbackCreateInfoEXT = struct ["VkStructureType  sType",
                                               "void * pNext",
                                               "VkDebugReportFlagsEXT  flags",
                                               "PFN_vkDebugReportCallbackEXT  pfnCallback",
                                               "void * pUserData"]

  VkDebugUtilsLabelEXT = struct ["VkStructureType  sType",
                                 "void * pNext",
                                 "char * pLabelName",
                                 "float  color [4]"]

  VkDebugUtilsObjectNameInfoEXT = struct ["VkStructureType  sType",
                                          "void * pNext",
                                          "VkObjectType  objectType",
                                          "uint64_t  objectHandle",
                                          "char * pObjectName"]
  VkDebugUtilsMessengerCallbackDataEXT = struct ["VkStructureType  sType",
                                                 "void * pNext",
                                                 "VkDebugUtilsMessengerCallbackDataFlagsEXT  flags",
                                                 "char * pMessageIdName",
                                                 "int32_t  messageIdNumber",
                                                 "char * pMessage",
                                                 "uint32_t  queueLabelCount",
                                                 "VkDebugUtilsLabelEXT * pQueueLabels",
                                                 "uint32_t  cmdBufLabelCount",
                                                 "VkDebugUtilsLabelEXT * pCmdBufLabels",
                                                 "uint32_t  objectCount",
                                                 "VkDebugUtilsObjectNameInfoEXT * pObjects"]

  VkDebugUtilsMessengerCreateInfoEXT = struct ["VkStructureType  sType",
                                               "void * pNext",
                                               "VkDebugUtilsMessengerCreateFlagsEXT  flags",
                                               "VkDebugUtilsMessageSeverityFlagsEXT  messageSeverity",
                                               "VkDebugUtilsMessageTypeFlagsEXT  messageType",
                                               "PFN_vkDebugUtilsMessengerCallbackEXT  pfnUserCallback",
                                               "void * pUserData"]

  VkDebugUtilsObjectTagInfoEXT = struct ["VkStructureType  sType",
                                         "void * pNext",
                                         "VkObjectType  objectType",
                                         "uint64_t  objectHandle",
                                         "uint64_t  tagName",
                                         "size_t  tagSize",
                                         "void * pTag"]

  VkDedicatedAllocationBufferCreateInfoNV = struct ["VkStructureType  sType",
                                                    "void * pNext",
                                                    "VkBool32  dedicatedAllocation"]

  VkDedicatedAllocationImageCreateInfoNV = struct ["VkStructureType  sType",
                                                   "void * pNext",
                                                   "VkBool32  dedicatedAllocation"]

  VkDedicatedAllocationMemoryAllocateInfoNV = struct ["VkStructureType  sType",
                                                      "void * pNext",
                                                      "VkImage  image",
                                                      "VkBuffer  buffer"]

  VkMemoryBarrier2 = struct ["VkStructureType  sType",
                             "void * pNext",
                             "VkPipelineStageFlags2  srcStageMask",
                             "VkAccessFlags2  srcAccessMask",
                             "VkPipelineStageFlags2  dstStageMask",
                             "VkAccessFlags2  dstAccessMask"]
  VkImageSubresourceRange = struct ["VkImageAspectFlags  aspectMask",
                                    "uint32_t  baseMipLevel",
                                    "uint32_t  levelCount",
                                    "uint32_t  baseArrayLayer",
                                    "uint32_t  layerCount"]
  VkImageMemoryBarrier2 = struct ["VkStructureType  sType",
                                  "void * pNext",
                                  "VkPipelineStageFlags2  srcStageMask",
                                  "VkAccessFlags2  srcAccessMask",
                                  "VkPipelineStageFlags2  dstStageMask",
                                  "VkAccessFlags2  dstAccessMask",
                                  "VkImageLayout  oldLayout",
                                  "VkImageLayout  newLayout",
                                  "uint32_t  srcQueueFamilyIndex",
                                  "uint32_t  dstQueueFamilyIndex",
                                  "VkImage  image",
                                  { "subresourceRange" => VkImageSubresourceRange }]
  VkDependencyInfo = struct ["VkStructureType  sType",
                             "void * pNext",
                             "VkDependencyFlags  dependencyFlags",
                             "uint32_t  memoryBarrierCount",
                             "VkMemoryBarrier2 * pMemoryBarriers",
                             "uint32_t  bufferMemoryBarrierCount",
                             "VkBufferMemoryBarrier2 * pBufferMemoryBarriers",
                             "uint32_t  imageMemoryBarrierCount",
                             "VkImageMemoryBarrier2 * pImageMemoryBarriers"]

  VkDependencyInfoKHR = VkDependencyInfo

  VkDescriptorBufferInfo = struct ["VkBuffer  buffer",
                                   "VkDeviceSize  offset",
                                   "VkDeviceSize  range"]

  VkDescriptorImageInfo = struct ["VkSampler  sampler",
                                  "VkImageView  imageView",
                                  "VkImageLayout  imageLayout"]

  VkDescriptorPoolSize = struct ["VkDescriptorType  type",
                                 "uint32_t  descriptorCount"]
  VkDescriptorPoolCreateInfo = struct ["VkStructureType  sType",
                                       "void * pNext",
                                       "VkDescriptorPoolCreateFlags  flags",
                                       "uint32_t  maxSets",
                                       "uint32_t  poolSizeCount",
                                       "VkDescriptorPoolSize * pPoolSizes"]

  VkDescriptorPoolInlineUniformBlockCreateInfo = struct ["VkStructureType  sType",
                                                         "void * pNext",
                                                         "uint32_t  maxInlineUniformBlockBindings"]

  VkDescriptorPoolInlineUniformBlockCreateInfoEXT = VkDescriptorPoolInlineUniformBlockCreateInfo

  VkDescriptorSetAllocateInfo = struct ["VkStructureType  sType",
                                        "void * pNext",
                                        "VkDescriptorPool  descriptorPool",
                                        "uint32_t  descriptorSetCount",
                                        "VkDescriptorSetLayout * pSetLayouts"]

  VkDescriptorSetBindingReferenceVALVE = struct ["VkStructureType  sType",
                                                 "void * pNext",
                                                 "VkDescriptorSetLayout  descriptorSetLayout",
                                                 "uint32_t  binding"]

  VkDescriptorSetLayoutBinding = struct ["uint32_t  binding",
                                         "VkDescriptorType  descriptorType",
                                         "uint32_t  descriptorCount",
                                         "VkShaderStageFlags  stageFlags",
                                         "VkSampler * pImmutableSamplers"]

  VkDescriptorSetLayoutBindingFlagsCreateInfo = struct ["VkStructureType  sType",
                                                        "void * pNext",
                                                        "uint32_t  bindingCount",
                                                        "VkDescriptorBindingFlags * pBindingFlags"]

  VkDescriptorSetLayoutBindingFlagsCreateInfoEXT = VkDescriptorSetLayoutBindingFlagsCreateInfo

  VkDescriptorSetLayoutCreateInfo = struct ["VkStructureType  sType",
                                            "void * pNext",
                                            "VkDescriptorSetLayoutCreateFlags  flags",
                                            "uint32_t  bindingCount",
                                            "VkDescriptorSetLayoutBinding * pBindings"]

  VkDescriptorSetLayoutHostMappingInfoVALVE = struct ["VkStructureType  sType",
                                                      "void * pNext",
                                                      "size_t  descriptorOffset",
                                                      "uint32_t  descriptorSize"]

  VkDescriptorSetLayoutSupport = struct ["VkStructureType  sType",
                                         "void * pNext",
                                         "VkBool32  supported"]

  VkDescriptorSetLayoutSupportKHR = VkDescriptorSetLayoutSupport

  VkDescriptorSetVariableDescriptorCountAllocateInfo = struct ["VkStructureType  sType",
                                                               "void * pNext",
                                                               "uint32_t  descriptorSetCount",
                                                               "uint32_t * pDescriptorCounts"]

  VkDescriptorSetVariableDescriptorCountAllocateInfoEXT = VkDescriptorSetVariableDescriptorCountAllocateInfo

  VkDescriptorSetVariableDescriptorCountLayoutSupport = struct ["VkStructureType  sType",
                                                                "void * pNext",
                                                                "uint32_t  maxVariableDescriptorCount"]

  VkDescriptorSetVariableDescriptorCountLayoutSupportEXT = VkDescriptorSetVariableDescriptorCountLayoutSupport

  VkDescriptorUpdateTemplateEntry = struct ["uint32_t  dstBinding",
                                            "uint32_t  dstArrayElement",
                                            "uint32_t  descriptorCount",
                                            "VkDescriptorType  descriptorType",
                                            "size_t  offset",
                                            "size_t  stride"]
  VkDescriptorUpdateTemplateCreateInfo = struct ["VkStructureType  sType",
                                                 "void * pNext",
                                                 "VkDescriptorUpdateTemplateCreateFlags  flags",
                                                 "uint32_t  descriptorUpdateEntryCount",
                                                 "VkDescriptorUpdateTemplateEntry * pDescriptorUpdateEntries",
                                                 "VkDescriptorUpdateTemplateType  templateType",
                                                 "VkDescriptorSetLayout  descriptorSetLayout",
                                                 "VkPipelineBindPoint  pipelineBindPoint",
                                                 "VkPipelineLayout  pipelineLayout",
                                                 "uint32_t  set"]

  VkDescriptorUpdateTemplateCreateInfoKHR = VkDescriptorUpdateTemplateCreateInfo

  VkDescriptorUpdateTemplateEntryKHR = VkDescriptorUpdateTemplateEntry

  VkDeviceBufferMemoryRequirements = struct ["VkStructureType  sType",
                                             "void * pNext",
                                             "VkBufferCreateInfo * pCreateInfo"]

  VkDeviceBufferMemoryRequirementsKHR = VkDeviceBufferMemoryRequirements

  VkDeviceQueueCreateInfo = struct ["VkStructureType  sType",
                                    "void * pNext",
                                    "VkDeviceQueueCreateFlags  flags",
                                    "uint32_t  queueFamilyIndex",
                                    "uint32_t  queueCount",
                                    "float * pQueuePriorities"]
  VkPhysicalDeviceFeatures = struct ["VkBool32  robustBufferAccess",
                                     "VkBool32  fullDrawIndexUint32",
                                     "VkBool32  imageCubeArray",
                                     "VkBool32  independentBlend",
                                     "VkBool32  geometryShader",
                                     "VkBool32  tessellationShader",
                                     "VkBool32  sampleRateShading",
                                     "VkBool32  dualSrcBlend",
                                     "VkBool32  logicOp",
                                     "VkBool32  multiDrawIndirect",
                                     "VkBool32  drawIndirectFirstInstance",
                                     "VkBool32  depthClamp",
                                     "VkBool32  depthBiasClamp",
                                     "VkBool32  fillModeNonSolid",
                                     "VkBool32  depthBounds",
                                     "VkBool32  wideLines",
                                     "VkBool32  largePoints",
                                     "VkBool32  alphaToOne",
                                     "VkBool32  multiViewport",
                                     "VkBool32  samplerAnisotropy",
                                     "VkBool32  textureCompressionETC2",
                                     "VkBool32  textureCompressionASTC_LDR",
                                     "VkBool32  textureCompressionBC",
                                     "VkBool32  occlusionQueryPrecise",
                                     "VkBool32  pipelineStatisticsQuery",
                                     "VkBool32  vertexPipelineStoresAndAtomics",
                                     "VkBool32  fragmentStoresAndAtomics",
                                     "VkBool32  shaderTessellationAndGeometryPointSize",
                                     "VkBool32  shaderImageGatherExtended",
                                     "VkBool32  shaderStorageImageExtendedFormats",
                                     "VkBool32  shaderStorageImageMultisample",
                                     "VkBool32  shaderStorageImageReadWithoutFormat",
                                     "VkBool32  shaderStorageImageWriteWithoutFormat",
                                     "VkBool32  shaderUniformBufferArrayDynamicIndexing",
                                     "VkBool32  shaderSampledImageArrayDynamicIndexing",
                                     "VkBool32  shaderStorageBufferArrayDynamicIndexing",
                                     "VkBool32  shaderStorageImageArrayDynamicIndexing",
                                     "VkBool32  shaderClipDistance",
                                     "VkBool32  shaderCullDistance",
                                     "VkBool32  shaderFloat64",
                                     "VkBool32  shaderInt64",
                                     "VkBool32  shaderInt16",
                                     "VkBool32  shaderResourceResidency",
                                     "VkBool32  shaderResourceMinLod",
                                     "VkBool32  sparseBinding",
                                     "VkBool32  sparseResidencyBuffer",
                                     "VkBool32  sparseResidencyImage2D",
                                     "VkBool32  sparseResidencyImage3D",
                                     "VkBool32  sparseResidency2Samples",
                                     "VkBool32  sparseResidency4Samples",
                                     "VkBool32  sparseResidency8Samples",
                                     "VkBool32  sparseResidency16Samples",
                                     "VkBool32  sparseResidencyAliased",
                                     "VkBool32  variableMultisampleRate",
                                     "VkBool32  inheritedQueries"]
  VkDeviceCreateInfo = struct ["VkStructureType  sType",
                               "void * pNext",
                               "VkDeviceCreateFlags  flags",
                               "uint32_t  queueCreateInfoCount",
                               "VkDeviceQueueCreateInfo * pQueueCreateInfos",
                               "uint32_t  enabledLayerCount",
                               "char * ppEnabledLayerNames",
                               "uint32_t  enabledExtensionCount",
                               "char * ppEnabledExtensionNames",
                               "VkPhysicalDeviceFeatures * pEnabledFeatures"]

  VkDeviceDeviceMemoryReportCreateInfoEXT = struct ["VkStructureType  sType",
                                                    "void * pNext",
                                                    "VkDeviceMemoryReportFlagsEXT  flags",
                                                    "PFN_vkDeviceMemoryReportCallbackEXT  pfnUserCallback",
                                                    "void * pUserData"]

  VkDeviceDiagnosticsConfigCreateInfoNV = struct ["VkStructureType  sType",
                                                  "void * pNext",
                                                  "VkDeviceDiagnosticsConfigFlagsNV  flags"]

  VkDeviceEventInfoEXT = struct ["VkStructureType  sType",
                                 "void * pNext",
                                 "VkDeviceEventTypeEXT  deviceEvent"]

  VkDeviceGroupBindSparseInfo = struct ["VkStructureType  sType",
                                        "void * pNext",
                                        "uint32_t  resourceDeviceIndex",
                                        "uint32_t  memoryDeviceIndex"]

  VkDeviceGroupBindSparseInfoKHR = VkDeviceGroupBindSparseInfo

  VkDeviceGroupCommandBufferBeginInfo = struct ["VkStructureType  sType",
                                                "void * pNext",
                                                "uint32_t  deviceMask"]

  VkDeviceGroupCommandBufferBeginInfoKHR = VkDeviceGroupCommandBufferBeginInfo

  VkDeviceGroupDeviceCreateInfo = struct ["VkStructureType  sType",
                                          "void * pNext",
                                          "uint32_t  physicalDeviceCount",
                                          "VkPhysicalDevice * pPhysicalDevices"]

  VkDeviceGroupDeviceCreateInfoKHR = VkDeviceGroupDeviceCreateInfo

  VkDeviceGroupPresentCapabilitiesKHR = struct ["VkStructureType  sType",
                                                "void * pNext",
                                                "uint32_t  presentMask[#{VK_MAX_DEVICE_GROUP_SIZE}]",
                                                "VkDeviceGroupPresentModeFlagsKHR  modes"]

  VkDeviceGroupPresentInfoKHR = struct ["VkStructureType  sType",
                                        "void * pNext",
                                        "uint32_t  swapchainCount",
                                        "uint32_t * pDeviceMasks",
                                        "VkDeviceGroupPresentModeFlagBitsKHR  mode"]

  VkDeviceGroupRenderPassBeginInfo = struct ["VkStructureType  sType",
                                             "void * pNext",
                                             "uint32_t  deviceMask",
                                             "uint32_t  deviceRenderAreaCount",
                                             "VkRect2D * pDeviceRenderAreas"]

  VkDeviceGroupRenderPassBeginInfoKHR = VkDeviceGroupRenderPassBeginInfo

  VkDeviceGroupSubmitInfo = struct ["VkStructureType  sType",
                                    "void * pNext",
                                    "uint32_t  waitSemaphoreCount",
                                    "uint32_t * pWaitSemaphoreDeviceIndices",
                                    "uint32_t  commandBufferCount",
                                    "uint32_t * pCommandBufferDeviceMasks",
                                    "uint32_t  signalSemaphoreCount",
                                    "uint32_t * pSignalSemaphoreDeviceIndices"]

  VkDeviceGroupSubmitInfoKHR = VkDeviceGroupSubmitInfo

  VkDeviceGroupSwapchainCreateInfoKHR = struct ["VkStructureType  sType",
                                                "void * pNext",
                                                "VkDeviceGroupPresentModeFlagsKHR  modes"]

  VkImageCreateInfo = struct ["VkStructureType  sType",
                              "void * pNext",
                              "VkImageCreateFlags  flags",
                              "VkImageType  imageType",
                              "VkFormat  format",
                              { "extent" => VkExtent3D },
                              "uint32_t  mipLevels",
                              "uint32_t  arrayLayers",
                              "VkSampleCountFlagBits  samples",
                              "VkImageTiling  tiling",
                              "VkImageUsageFlags  usage",
                              "VkSharingMode  sharingMode",
                              "uint32_t  queueFamilyIndexCount",
                              "uint32_t * pQueueFamilyIndices",
                              "VkImageLayout  initialLayout"]
  VkDeviceImageMemoryRequirements = struct ["VkStructureType  sType",
                                            "void * pNext",
                                            "VkImageCreateInfo * pCreateInfo",
                                            "VkImageAspectFlagBits  planeAspect"]

  VkDeviceImageMemoryRequirementsKHR = VkDeviceImageMemoryRequirements

  VkDeviceMemoryOpaqueCaptureAddressInfo = struct ["VkStructureType  sType",
                                                   "void * pNext",
                                                   "VkDeviceMemory  memory"]

  VkDeviceMemoryOpaqueCaptureAddressInfoKHR = VkDeviceMemoryOpaqueCaptureAddressInfo

  VkDeviceMemoryOverallocationCreateInfoAMD = struct ["VkStructureType  sType",
                                                      "void * pNext",
                                                      "VkMemoryOverallocationBehaviorAMD  overallocationBehavior"]

  VkDeviceMemoryReportCallbackDataEXT = struct ["VkStructureType  sType",
                                                "void * pNext",
                                                "VkDeviceMemoryReportFlagsEXT  flags",
                                                "VkDeviceMemoryReportEventTypeEXT  type",
                                                "uint64_t  memoryObjectId",
                                                "VkDeviceSize  size",
                                                "VkObjectType  objectType",
                                                "uint64_t  objectHandle",
                                                "uint32_t  heapIndex"]

  VkDevicePrivateDataCreateInfo = struct ["VkStructureType  sType",
                                          "void * pNext",
                                          "uint32_t  privateDataSlotRequestCount"]

  VkDevicePrivateDataCreateInfoEXT = VkDevicePrivateDataCreateInfo

  VkDeviceQueueGlobalPriorityCreateInfoKHR = struct ["VkStructureType  sType",
                                                     "void * pNext",
                                                     "VkQueueGlobalPriorityKHR  globalPriority"]
  VkDeviceQueueGlobalPriorityCreateInfoEXT = VkDeviceQueueGlobalPriorityCreateInfoKHR

  VkDeviceQueueInfo2 = struct ["VkStructureType  sType",
                               "void * pNext",
                               "VkDeviceQueueCreateFlags  flags",
                               "uint32_t  queueFamilyIndex",
                               "uint32_t  queueIndex"]

  VkDirectFBSurfaceCreateInfoEXT = struct ["VkStructureType  sType",
                                           "void * pNext",
                                           "VkDirectFBSurfaceCreateFlagsEXT  flags",
                                           "IDirectFB * dfb",
                                           "IDirectFBSurface * surface"]

  VkDispatchIndirectCommand = struct ["uint32_t  x",
                                      "uint32_t  y",
                                      "uint32_t  z"]

  VkDisplayEventInfoEXT = struct ["VkStructureType  sType",
                                  "void * pNext",
                                  "VkDisplayEventTypeEXT  displayEvent"]

  VkDisplayModeParametersKHR = struct [{ "visibleRegion" => VkExtent2D },
                                       "uint32_t  refreshRate"]
  VkDisplayModeCreateInfoKHR = struct ["VkStructureType  sType",
                                       "void * pNext",
                                       "VkDisplayModeCreateFlagsKHR  flags",
                                       { "parameters" => VkDisplayModeParametersKHR }]

  VkDisplayModePropertiesKHR = struct ["VkDisplayModeKHR  displayMode",
                                       { "parameters" => VkDisplayModeParametersKHR }]
  VkDisplayModeProperties2KHR = struct ["VkStructureType  sType",
                                        "void * pNext",
                                        { "displayModeProperties" => VkDisplayModePropertiesKHR }]

  VkDisplayNativeHdrSurfaceCapabilitiesAMD = struct ["VkStructureType  sType",
                                                     "void * pNext",
                                                     "VkBool32  localDimmingSupport"]

  VkDisplayPlaneCapabilitiesKHR = struct ["VkDisplayPlaneAlphaFlagsKHR  supportedAlpha",
                                          { "minSrcPosition" => VkOffset2D },
                                          { "maxSrcPosition" => VkOffset2D },
                                          { "minSrcExtent" => VkExtent2D },
                                          { "maxSrcExtent" => VkExtent2D },
                                          { "minDstPosition" => VkOffset2D },
                                          { "maxDstPosition" => VkOffset2D },
                                          { "minDstExtent" => VkExtent2D },
                                          { "maxDstExtent" => VkExtent2D }]
  VkDisplayPlaneCapabilities2KHR = struct ["VkStructureType  sType",
                                           "void * pNext",
                                           { "capabilities" => VkDisplayPlaneCapabilitiesKHR }]

  VkDisplayPlaneInfo2KHR = struct ["VkStructureType  sType",
                                   "void * pNext",
                                   "VkDisplayModeKHR  mode",
                                   "uint32_t  planeIndex"]

  VkDisplayPlanePropertiesKHR = struct ["VkDisplayKHR  currentDisplay",
                                        "uint32_t  currentStackIndex"]
  VkDisplayPlaneProperties2KHR = struct ["VkStructureType  sType",
                                         "void * pNext",
                                         { "displayPlaneProperties" => VkDisplayPlanePropertiesKHR }]

  VkDisplayPowerInfoEXT = struct ["VkStructureType  sType",
                                  "void * pNext",
                                  "VkDisplayPowerStateEXT  powerState"]

  VkDisplayPresentInfoKHR = struct ["VkStructureType  sType",
                                    "void * pNext",
                                    { "srcRect" => VkRect2D },
                                    { "dstRect" => VkRect2D },
                                    "VkBool32  persistent"]

  VkDisplayPropertiesKHR = struct ["VkDisplayKHR  display",
                                   "char * displayName",
                                   { "physicalDimensions" => VkExtent2D },
                                   { "physicalResolution" => VkExtent2D },
                                   "VkSurfaceTransformFlagsKHR  supportedTransforms",
                                   "VkBool32  planeReorderPossible",
                                   "VkBool32  persistentContent"]
  VkDisplayProperties2KHR = struct ["VkStructureType  sType",
                                    "void * pNext",
                                    { "displayProperties" => VkDisplayPropertiesKHR }]

  VkDisplaySurfaceCreateInfoKHR = struct ["VkStructureType  sType",
                                          "void * pNext",
                                          "VkDisplaySurfaceCreateFlagsKHR  flags",
                                          "VkDisplayModeKHR  displayMode",
                                          "uint32_t  planeIndex",
                                          "uint32_t  planeStackIndex",
                                          "VkSurfaceTransformFlagBitsKHR  transform",
                                          "float  globalAlpha",
                                          "VkDisplayPlaneAlphaFlagBitsKHR  alphaMode",
                                          { "imageExtent" => VkExtent2D }]

  VkDrawIndexedIndirectCommand = struct ["uint32_t  indexCount",
                                         "uint32_t  instanceCount",
                                         "uint32_t  firstIndex",
                                         "int32_t  vertexOffset",
                                         "uint32_t  firstInstance"]

  VkDrawIndirectCommand = struct ["uint32_t  vertexCount",
                                  "uint32_t  instanceCount",
                                  "uint32_t  firstVertex",
                                  "uint32_t  firstInstance"]

  VkDrawMeshTasksIndirectCommandNV = struct ["uint32_t  taskCount",
                                             "uint32_t  firstTask"]

  VkDrmFormatModifierProperties2EXT = struct ["uint64_t  drmFormatModifier",
                                              "uint32_t  drmFormatModifierPlaneCount",
                                              "VkFormatFeatureFlags2  drmFormatModifierTilingFeatures"]

  VkDrmFormatModifierPropertiesEXT = struct ["uint64_t  drmFormatModifier",
                                             "uint32_t  drmFormatModifierPlaneCount",
                                             "VkFormatFeatureFlags  drmFormatModifierTilingFeatures"]

  VkDrmFormatModifierPropertiesList2EXT = struct ["VkStructureType  sType",
                                                  "void * pNext",
                                                  "uint32_t  drmFormatModifierCount",
                                                  "VkDrmFormatModifierProperties2EXT * pDrmFormatModifierProperties"]

  VkDrmFormatModifierPropertiesListEXT = struct ["VkStructureType  sType",
                                                 "void * pNext",
                                                 "uint32_t  drmFormatModifierCount",
                                                 "VkDrmFormatModifierPropertiesEXT * pDrmFormatModifierProperties"]

  VkEventCreateInfo = struct ["VkStructureType  sType",
                              "void * pNext",
                              "VkEventCreateFlags  flags"]

  VkExportFenceCreateInfo = struct ["VkStructureType  sType",
                                    "void * pNext",
                                    "VkExternalFenceHandleTypeFlags  handleTypes"]

  VkExportFenceCreateInfoKHR = VkExportFenceCreateInfo

  VkExportFenceWin32HandleInfoKHR = struct ["VkStructureType  sType",
                                            "void * pNext",
                                            "SECURITY_ATTRIBUTES * pAttributes",
                                            "DWORD  dwAccess",
                                            "LPCWSTR  name"]

  VkExportMemoryAllocateInfo = struct ["VkStructureType  sType",
                                       "void * pNext",
                                       "VkExternalMemoryHandleTypeFlags  handleTypes"]

  VkExportMemoryAllocateInfoKHR = VkExportMemoryAllocateInfo

  VkExportMemoryAllocateInfoNV = struct ["VkStructureType  sType",
                                         "void * pNext",
                                         "VkExternalMemoryHandleTypeFlagsNV  handleTypes"]

  VkExportMemoryWin32HandleInfoKHR = struct ["VkStructureType  sType",
                                             "void * pNext",
                                             "SECURITY_ATTRIBUTES * pAttributes",
                                             "DWORD  dwAccess",
                                             "LPCWSTR  name"]

  VkExportMemoryWin32HandleInfoNV = struct ["VkStructureType  sType",
                                            "void * pNext",
                                            "SECURITY_ATTRIBUTES * pAttributes",
                                            "DWORD  dwAccess"]

  VkExportSemaphoreCreateInfo = struct ["VkStructureType  sType",
                                        "void * pNext",
                                        "VkExternalSemaphoreHandleTypeFlags  handleTypes"]

  VkExportSemaphoreCreateInfoKHR = VkExportSemaphoreCreateInfo

  VkExportSemaphoreWin32HandleInfoKHR = struct ["VkStructureType  sType",
                                                "void * pNext",
                                                "SECURITY_ATTRIBUTES * pAttributes",
                                                "DWORD  dwAccess",
                                                "LPCWSTR  name"]

  VkExtensionProperties = struct ["char  extensionName[#{VK_MAX_EXTENSION_NAME_SIZE}]",
                                  "uint32_t  specVersion"]

  VkExternalMemoryProperties = struct ["VkExternalMemoryFeatureFlags  externalMemoryFeatures",
                                       "VkExternalMemoryHandleTypeFlags  exportFromImportedHandleTypes",
                                       "VkExternalMemoryHandleTypeFlags  compatibleHandleTypes"]
  VkExternalBufferProperties = struct ["VkStructureType  sType",
                                       "void * pNext",
                                       { "externalMemoryProperties" => VkExternalMemoryProperties }]

  VkExternalBufferPropertiesKHR = VkExternalBufferProperties

  VkExternalFenceProperties = struct ["VkStructureType  sType",
                                      "void * pNext",
                                      "VkExternalFenceHandleTypeFlags  exportFromImportedHandleTypes",
                                      "VkExternalFenceHandleTypeFlags  compatibleHandleTypes",
                                      "VkExternalFenceFeatureFlags  externalFenceFeatures"]

  VkExternalFencePropertiesKHR = VkExternalFenceProperties

  VkExternalFormatANDROID = struct ["VkStructureType  sType",
                                    "void * pNext",
                                    "uint64_t  externalFormat"]

  VkExternalImageFormatProperties = struct ["VkStructureType  sType",
                                            "void * pNext",
                                            { "externalMemoryProperties" => VkExternalMemoryProperties }]

  VkExternalImageFormatPropertiesKHR = VkExternalImageFormatProperties

  VkImageFormatProperties = struct [{ "maxExtent" => VkExtent3D },
                                    "uint32_t  maxMipLevels",
                                    "uint32_t  maxArrayLayers",
                                    "VkSampleCountFlags  sampleCounts",
                                    "VkDeviceSize  maxResourceSize"]
  VkExternalImageFormatPropertiesNV = struct [{ "imageFormatProperties" => VkImageFormatProperties },
                                              "VkExternalMemoryFeatureFlagsNV  externalMemoryFeatures",
                                              "VkExternalMemoryHandleTypeFlagsNV  exportFromImportedHandleTypes",
                                              "VkExternalMemoryHandleTypeFlagsNV  compatibleHandleTypes"]

  VkExternalMemoryBufferCreateInfo = struct ["VkStructureType  sType",
                                             "void * pNext",
                                             "VkExternalMemoryHandleTypeFlags  handleTypes"]

  VkExternalMemoryBufferCreateInfoKHR = VkExternalMemoryBufferCreateInfo

  VkExternalMemoryImageCreateInfo = struct ["VkStructureType  sType",
                                            "void * pNext",
                                            "VkExternalMemoryHandleTypeFlags  handleTypes"]

  VkExternalMemoryImageCreateInfoKHR = VkExternalMemoryImageCreateInfo

  VkExternalMemoryImageCreateInfoNV = struct ["VkStructureType  sType",
                                              "void * pNext",
                                              "VkExternalMemoryHandleTypeFlagsNV  handleTypes"]

  VkExternalMemoryPropertiesKHR = VkExternalMemoryProperties

  VkExternalSemaphoreProperties = struct ["VkStructureType  sType",
                                          "void * pNext",
                                          "VkExternalSemaphoreHandleTypeFlags  exportFromImportedHandleTypes",
                                          "VkExternalSemaphoreHandleTypeFlags  compatibleHandleTypes",
                                          "VkExternalSemaphoreFeatureFlags  externalSemaphoreFeatures"]

  VkExternalSemaphorePropertiesKHR = VkExternalSemaphoreProperties

  VkFenceCreateInfo = struct ["VkStructureType  sType",
                              "void * pNext",
                              "VkFenceCreateFlags  flags"]

  VkFenceGetFdInfoKHR = struct ["VkStructureType  sType",
                                "void * pNext",
                                "VkFence  fence",
                                "VkExternalFenceHandleTypeFlagBits  handleType"]

  VkFenceGetWin32HandleInfoKHR = struct ["VkStructureType  sType",
                                         "void * pNext",
                                         "VkFence  fence",
                                         "VkExternalFenceHandleTypeFlagBits  handleType"]

  VkFilterCubicImageViewImageFormatPropertiesEXT = struct ["VkStructureType  sType",
                                                           "void * pNext",
                                                           "VkBool32  filterCubic",
                                                           "VkBool32  filterCubicMinmax"]

  VkFormatProperties = struct ["VkFormatFeatureFlags  linearTilingFeatures",
                               "VkFormatFeatureFlags  optimalTilingFeatures",
                               "VkFormatFeatureFlags  bufferFeatures"]

  VkFormatProperties2 = struct ["VkStructureType  sType",
                                "void * pNext",
                                { "formatProperties" => VkFormatProperties }]

  VkFormatProperties2KHR = VkFormatProperties2

  VkFormatProperties3 = struct ["VkStructureType  sType",
                                "void * pNext",
                                "VkFormatFeatureFlags2  linearTilingFeatures",
                                "VkFormatFeatureFlags2  optimalTilingFeatures",
                                "VkFormatFeatureFlags2  bufferFeatures"]

  VkFormatProperties3KHR = VkFormatProperties3

  VkFragmentShadingRateAttachmentInfoKHR = struct ["VkStructureType  sType",
                                                   "void * pNext",
                                                   "VkAttachmentReference2 * pFragmentShadingRateAttachment",
                                                   { "shadingRateAttachmentTexelSize" => VkExtent2D }]

  VkFramebufferAttachmentImageInfo = struct ["VkStructureType  sType",
                                             "void * pNext",
                                             "VkImageCreateFlags  flags",
                                             "VkImageUsageFlags  usage",
                                             "uint32_t  width",
                                             "uint32_t  height",
                                             "uint32_t  layerCount",
                                             "uint32_t  viewFormatCount",
                                             "VkFormat * pViewFormats"]

  VkFramebufferAttachmentImageInfoKHR = VkFramebufferAttachmentImageInfo

  VkFramebufferAttachmentsCreateInfo = struct ["VkStructureType  sType",
                                               "void * pNext",
                                               "uint32_t  attachmentImageInfoCount",
                                               "VkFramebufferAttachmentImageInfo * pAttachmentImageInfos"]

  VkFramebufferAttachmentsCreateInfoKHR = VkFramebufferAttachmentsCreateInfo

  VkFramebufferCreateInfo = struct ["VkStructureType  sType",
                                    "void * pNext",
                                    "VkFramebufferCreateFlags  flags",
                                    "VkRenderPass  renderPass",
                                    "uint32_t  attachmentCount",
                                    "VkImageView * pAttachments",
                                    "uint32_t  width",
                                    "uint32_t  height",
                                    "uint32_t  layers"]

  VkFramebufferMixedSamplesCombinationNV = struct ["VkStructureType  sType",
                                                   "void * pNext",
                                                   "VkCoverageReductionModeNV  coverageReductionMode",
                                                   "VkSampleCountFlagBits  rasterizationSamples",
                                                   "VkSampleCountFlags  depthStencilSamples",
                                                   "VkSampleCountFlags  colorSamples"]

  VkIndirectCommandsStreamNV = struct ["VkBuffer  buffer",
                                       "VkDeviceSize  offset"]
  VkGeneratedCommandsInfoNV = struct ["VkStructureType  sType",
                                      "void * pNext",
                                      "VkPipelineBindPoint  pipelineBindPoint",
                                      "VkPipeline  pipeline",
                                      "VkIndirectCommandsLayoutNV  indirectCommandsLayout",
                                      "uint32_t  streamCount",
                                      "VkIndirectCommandsStreamNV * pStreams",
                                      "uint32_t  sequencesCount",
                                      "VkBuffer  preprocessBuffer",
                                      "VkDeviceSize  preprocessOffset",
                                      "VkDeviceSize  preprocessSize",
                                      "VkBuffer  sequencesCountBuffer",
                                      "VkDeviceSize  sequencesCountOffset",
                                      "VkBuffer  sequencesIndexBuffer",
                                      "VkDeviceSize  sequencesIndexOffset"]

  VkGeneratedCommandsMemoryRequirementsInfoNV = struct ["VkStructureType  sType",
                                                        "void * pNext",
                                                        "VkPipelineBindPoint  pipelineBindPoint",
                                                        "VkPipeline  pipeline",
                                                        "VkIndirectCommandsLayoutNV  indirectCommandsLayout",
                                                        "uint32_t  maxSequencesCount"]

  VkVertexInputBindingDescription = struct ["uint32_t  binding",
                                            "uint32_t  stride",
                                            "VkVertexInputRate  inputRate"]
  VkVertexInputAttributeDescription = struct ["uint32_t  location",
                                              "uint32_t  binding",
                                              "VkFormat  format",
                                              "uint32_t  offset"]
  VkPipelineVertexInputStateCreateInfo = struct ["VkStructureType  sType",
                                                 "void * pNext",
                                                 "VkPipelineVertexInputStateCreateFlags  flags",
                                                 "uint32_t  vertexBindingDescriptionCount",
                                                 "VkVertexInputBindingDescription * pVertexBindingDescriptions",
                                                 "uint32_t  vertexAttributeDescriptionCount",
                                                 "VkVertexInputAttributeDescription * pVertexAttributeDescriptions"]
  VkPipelineInputAssemblyStateCreateInfo = struct ["VkStructureType  sType",
                                                   "void * pNext",
                                                   "VkPipelineInputAssemblyStateCreateFlags  flags",
                                                   "VkPrimitiveTopology  topology",
                                                   "VkBool32  primitiveRestartEnable"]
  VkPipelineTessellationStateCreateInfo = struct ["VkStructureType  sType",
                                                  "void * pNext",
                                                  "VkPipelineTessellationStateCreateFlags  flags",
                                                  "uint32_t  patchControlPoints"]
  VkPipelineViewportStateCreateInfo = struct ["VkStructureType  sType",
                                              "void * pNext",
                                              "VkPipelineViewportStateCreateFlags  flags",
                                              "uint32_t  viewportCount",
                                              "VkViewport * pViewports",
                                              "uint32_t  scissorCount",
                                              "VkRect2D * pScissors"]
  VkPipelineRasterizationStateCreateInfo = struct ["VkStructureType  sType",
                                                   "void * pNext",
                                                   "VkPipelineRasterizationStateCreateFlags  flags",
                                                   "VkBool32  depthClampEnable",
                                                   "VkBool32  rasterizerDiscardEnable",
                                                   "VkPolygonMode  polygonMode",
                                                   "VkCullModeFlags  cullMode",
                                                   "VkFrontFace  frontFace",
                                                   "VkBool32  depthBiasEnable",
                                                   "float  depthBiasConstantFactor",
                                                   "float  depthBiasClamp",
                                                   "float  depthBiasSlopeFactor",
                                                   "float  lineWidth"]
  VkPipelineMultisampleStateCreateInfo = struct ["VkStructureType  sType",
                                                 "void * pNext",
                                                 "VkPipelineMultisampleStateCreateFlags  flags",
                                                 "VkSampleCountFlagBits  rasterizationSamples",
                                                 "VkBool32  sampleShadingEnable",
                                                 "float  minSampleShading",
                                                 "VkSampleMask * pSampleMask",
                                                 "VkBool32  alphaToCoverageEnable",
                                                 "VkBool32  alphaToOneEnable"]
  VkStencilOpState = struct ["VkStencilOp  failOp",
                             "VkStencilOp  passOp",
                             "VkStencilOp  depthFailOp",
                             "VkCompareOp  compareOp",
                             "uint32_t  compareMask",
                             "uint32_t  writeMask",
                             "uint32_t  reference"]
  VkPipelineDepthStencilStateCreateInfo = struct ["VkStructureType  sType",
                                                  "void * pNext",
                                                  "VkPipelineDepthStencilStateCreateFlags  flags",
                                                  "VkBool32  depthTestEnable",
                                                  "VkBool32  depthWriteEnable",
                                                  "VkCompareOp  depthCompareOp",
                                                  "VkBool32  depthBoundsTestEnable",
                                                  "VkBool32  stencilTestEnable",
                                                  { "front" => VkStencilOpState },
                                                  { "back" => VkStencilOpState },
                                                  "float  minDepthBounds",
                                                  "float  maxDepthBounds"]
  VkPipelineColorBlendAttachmentState = struct ["VkBool32  blendEnable",
                                                "VkBlendFactor  srcColorBlendFactor",
                                                "VkBlendFactor  dstColorBlendFactor",
                                                "VkBlendOp  colorBlendOp",
                                                "VkBlendFactor  srcAlphaBlendFactor",
                                                "VkBlendFactor  dstAlphaBlendFactor",
                                                "VkBlendOp  alphaBlendOp",
                                                "VkColorComponentFlags  colorWriteMask"]
  VkPipelineColorBlendStateCreateInfo = struct ["VkStructureType  sType",
                                                "void * pNext",
                                                "VkPipelineColorBlendStateCreateFlags  flags",
                                                "VkBool32  logicOpEnable",
                                                "VkLogicOp  logicOp",
                                                "uint32_t  attachmentCount",
                                                "VkPipelineColorBlendAttachmentState * pAttachments",
                                                "float  blendConstants [4]"]
  VkPipelineDynamicStateCreateInfo = struct ["VkStructureType  sType",
                                             "void * pNext",
                                             "VkPipelineDynamicStateCreateFlags  flags",
                                             "uint32_t  dynamicStateCount",
                                             "VkDynamicState * pDynamicStates"]
  VkGraphicsPipelineCreateInfo = struct ["VkStructureType  sType",
                                         "void * pNext",
                                         "VkPipelineCreateFlags  flags",
                                         "uint32_t  stageCount",
                                         "VkPipelineShaderStageCreateInfo * pStages",
                                         "VkPipelineVertexInputStateCreateInfo * pVertexInputState",
                                         "VkPipelineInputAssemblyStateCreateInfo * pInputAssemblyState",
                                         "VkPipelineTessellationStateCreateInfo * pTessellationState",
                                         "VkPipelineViewportStateCreateInfo * pViewportState",
                                         "VkPipelineRasterizationStateCreateInfo * pRasterizationState",
                                         "VkPipelineMultisampleStateCreateInfo * pMultisampleState",
                                         "VkPipelineDepthStencilStateCreateInfo * pDepthStencilState",
                                         "VkPipelineColorBlendStateCreateInfo * pColorBlendState",
                                         "VkPipelineDynamicStateCreateInfo * pDynamicState",
                                         "VkPipelineLayout  layout",
                                         "VkRenderPass  renderPass",
                                         "uint32_t  subpass",
                                         "VkPipeline  basePipelineHandle",
                                         "int32_t  basePipelineIndex"]

  VkGraphicsShaderGroupCreateInfoNV = struct ["VkStructureType  sType",
                                              "void * pNext",
                                              "uint32_t  stageCount",
                                              "VkPipelineShaderStageCreateInfo * pStages",
                                              "VkPipelineVertexInputStateCreateInfo * pVertexInputState",
                                              "VkPipelineTessellationStateCreateInfo * pTessellationState"]
  VkGraphicsPipelineShaderGroupsCreateInfoNV = struct ["VkStructureType  sType",
                                                       "void * pNext",
                                                       "uint32_t  groupCount",
                                                       "VkGraphicsShaderGroupCreateInfoNV * pGroups",
                                                       "uint32_t  pipelineCount",
                                                       "VkPipeline * pPipelines"]

  # Chromaticity coordinate
  VkXYColorEXT = struct ["float  x",
                         "float  y"]
  VkHdrMetadataEXT = struct ["VkStructureType  sType",
                             "void * pNext",
                             { "displayPrimaryRed" => VkXYColorEXT },
                             { "displayPrimaryGreen" => VkXYColorEXT },
                             { "displayPrimaryBlue" => VkXYColorEXT },
                             { "whitePoint" => VkXYColorEXT },
                             "float  maxLuminance",
                             "float  minLuminance",
                             "float  maxContentLightLevel",
                             "float  maxFrameAverageLightLevel"]

  VkHeadlessSurfaceCreateInfoEXT = struct ["VkStructureType  sType",
                                           "void * pNext",
                                           "VkHeadlessSurfaceCreateFlagsEXT  flags"]

  VkIOSSurfaceCreateInfoMVK = struct ["VkStructureType  sType",
                                      "void * pNext",
                                      "VkIOSSurfaceCreateFlagsMVK  flags",
                                      "void * pView"]

  VkImageBlit = struct [{ "srcSubresource" => VkImageSubresourceLayers },
                        { "srcOffsets[2]" => VkOffset3D },
                        { "dstSubresource" => VkImageSubresourceLayers },
                        { "dstOffsets[2]" => VkOffset3D }]

  VkImageBlit2KHR = VkImageBlit2

  VkImageFormatConstraintsInfoFUCHSIA = struct ["VkStructureType  sType",
                                                "void * pNext",
                                                { "imageCreateInfo" => VkImageCreateInfo },
                                                "VkFormatFeatureFlags  requiredFormatFeatures",
                                                "VkImageFormatConstraintsFlagsFUCHSIA  flags",
                                                "uint64_t  sysmemPixelFormat",
                                                "uint32_t  colorSpaceCount",
                                                "VkSysmemColorSpaceFUCHSIA * pColorSpaces"]
  VkImageConstraintsInfoFUCHSIA = struct ["VkStructureType  sType",
                                          "void * pNext",
                                          "uint32_t  formatConstraintsCount",
                                          "VkImageFormatConstraintsInfoFUCHSIA * pFormatConstraints",
                                          { "bufferCollectionConstraints" => VkBufferCollectionConstraintsInfoFUCHSIA },
                                          "VkImageConstraintsInfoFlagsFUCHSIA  flags"]

  VkImageCopy = struct [{ "srcSubresource" => VkImageSubresourceLayers },
                        { "srcOffset" => VkOffset3D },
                        { "dstSubresource" => VkImageSubresourceLayers },
                        { "dstOffset" => VkOffset3D },
                        { "extent" => VkExtent3D }]

  VkImageCopy2KHR = VkImageCopy2

  VkSubresourceLayout = struct ["VkDeviceSize  offset",
                                "VkDeviceSize  size",
                                "VkDeviceSize  rowPitch",
                                "VkDeviceSize  arrayPitch",
                                "VkDeviceSize  depthPitch"]
  VkImageDrmFormatModifierExplicitCreateInfoEXT = struct ["VkStructureType  sType",
                                                          "void * pNext",
                                                          "uint64_t  drmFormatModifier",
                                                          "uint32_t  drmFormatModifierPlaneCount",
                                                          "VkSubresourceLayout * pPlaneLayouts"]

  VkImageDrmFormatModifierListCreateInfoEXT = struct ["VkStructureType  sType",
                                                      "void * pNext",
                                                      "uint32_t  drmFormatModifierCount",
                                                      "uint64_t * pDrmFormatModifiers"]

  VkImageDrmFormatModifierPropertiesEXT = struct ["VkStructureType  sType",
                                                  "void * pNext",
                                                  "uint64_t  drmFormatModifier"]

  VkImageFormatListCreateInfo = struct ["VkStructureType  sType",
                                        "void * pNext",
                                        "uint32_t  viewFormatCount",
                                        "VkFormat * pViewFormats"]

  VkImageFormatListCreateInfoKHR = VkImageFormatListCreateInfo

  VkImageFormatProperties2 = struct ["VkStructureType  sType",
                                     "void * pNext",
                                     { "imageFormatProperties" => VkImageFormatProperties }]

  VkImageFormatProperties2KHR = VkImageFormatProperties2

  VkImageMemoryBarrier = struct ["VkStructureType  sType",
                                 "void * pNext",
                                 "VkAccessFlags  srcAccessMask",
                                 "VkAccessFlags  dstAccessMask",
                                 "VkImageLayout  oldLayout",
                                 "VkImageLayout  newLayout",
                                 "uint32_t  srcQueueFamilyIndex",
                                 "uint32_t  dstQueueFamilyIndex",
                                 "VkImage  image",
                                 { "subresourceRange" => VkImageSubresourceRange }]

  VkImageMemoryBarrier2KHR = VkImageMemoryBarrier2

  VkImageMemoryRequirementsInfo2 = struct ["VkStructureType  sType",
                                           "void * pNext",
                                           "VkImage  image"]

  VkImageMemoryRequirementsInfo2KHR = VkImageMemoryRequirementsInfo2

  VkImagePipeSurfaceCreateInfoFUCHSIA = struct ["VkStructureType  sType",
                                                "void * pNext",
                                                "VkImagePipeSurfaceCreateFlagsFUCHSIA  flags",
                                                "zx_handle_t  imagePipeHandle"]

  VkImagePlaneMemoryRequirementsInfo = struct ["VkStructureType  sType",
                                               "void * pNext",
                                               "VkImageAspectFlagBits  planeAspect"]

  VkImagePlaneMemoryRequirementsInfoKHR = VkImagePlaneMemoryRequirementsInfo

  VkImageResolve = struct [{ "srcSubresource" => VkImageSubresourceLayers },
                           { "srcOffset" => VkOffset3D },
                           { "dstSubresource" => VkImageSubresourceLayers },
                           { "dstOffset" => VkOffset3D },
                           { "extent" => VkExtent3D }]

  VkImageResolve2 = struct ["VkStructureType  sType",
                            "void * pNext",
                            { "srcSubresource" => VkImageSubresourceLayers },
                            { "srcOffset" => VkOffset3D },
                            { "dstSubresource" => VkImageSubresourceLayers },
                            { "dstOffset" => VkOffset3D },
                            { "extent" => VkExtent3D }]

  VkImageResolve2KHR = VkImageResolve2

  VkImageSparseMemoryRequirementsInfo2 = struct ["VkStructureType  sType",
                                                 "void * pNext",
                                                 "VkImage  image"]

  VkImageSparseMemoryRequirementsInfo2KHR = VkImageSparseMemoryRequirementsInfo2

  VkImageStencilUsageCreateInfo = struct ["VkStructureType  sType",
                                          "void * pNext",
                                          "VkImageUsageFlags  stencilUsage"]

  VkImageStencilUsageCreateInfoEXT = VkImageStencilUsageCreateInfo

  VkImageSwapchainCreateInfoKHR = struct ["VkStructureType  sType",
                                          "void * pNext",
                                          "VkSwapchainKHR  swapchain"]

  VkImageViewASTCDecodeModeEXT = struct ["VkStructureType  sType",
                                         "void * pNext",
                                         "VkFormat  decodeMode"]

  VkImageViewAddressPropertiesNVX = struct ["VkStructureType  sType",
                                            "void * pNext",
                                            "VkDeviceAddress  deviceAddress",
                                            "VkDeviceSize  size"]

  VkImageViewCreateInfo = struct ["VkStructureType  sType",
                                  "void * pNext",
                                  "VkImageViewCreateFlags  flags",
                                  "VkImage  image",
                                  "VkImageViewType  viewType",
                                  "VkFormat  format",
                                  { "components" => VkComponentMapping },
                                  { "subresourceRange" => VkImageSubresourceRange }]

  VkImageViewHandleInfoNVX = struct ["VkStructureType  sType",
                                     "void * pNext",
                                     "VkImageView  imageView",
                                     "VkDescriptorType  descriptorType",
                                     "VkSampler  sampler"]

  VkImageViewMinLodCreateInfoEXT = struct ["VkStructureType  sType",
                                           "void * pNext",
                                           "float  minLod"]

  VkImageViewUsageCreateInfo = struct ["VkStructureType  sType",
                                       "void * pNext",
                                       "VkImageUsageFlags  usage"]

  VkImageViewUsageCreateInfoKHR = VkImageViewUsageCreateInfo

  VkImportAndroidHardwareBufferInfoANDROID = struct ["VkStructureType  sType",
                                                     "void * pNext",
                                                     "AHardwareBuffer * buffer"]

  VkImportFenceFdInfoKHR = struct ["VkStructureType  sType",
                                   "void * pNext",
                                   "VkFence  fence",
                                   "VkFenceImportFlags  flags",
                                   "VkExternalFenceHandleTypeFlagBits  handleType",
                                   "int  fd"]

  VkImportFenceWin32HandleInfoKHR = struct ["VkStructureType  sType",
                                            "void * pNext",
                                            "VkFence  fence",
                                            "VkFenceImportFlags  flags",
                                            "VkExternalFenceHandleTypeFlagBits  handleType",
                                            "HANDLE  handle",
                                            "LPCWSTR  name"]

  VkImportMemoryBufferCollectionFUCHSIA = struct ["VkStructureType  sType",
                                                  "void * pNext",
                                                  "VkBufferCollectionFUCHSIA  collection",
                                                  "uint32_t  index"]

  VkImportMemoryFdInfoKHR = struct ["VkStructureType  sType",
                                    "void * pNext",
                                    "VkExternalMemoryHandleTypeFlagBits  handleType",
                                    "int  fd"]

  VkImportMemoryHostPointerInfoEXT = struct ["VkStructureType  sType",
                                             "void * pNext",
                                             "VkExternalMemoryHandleTypeFlagBits  handleType",
                                             "void * pHostPointer"]

  VkImportMemoryWin32HandleInfoKHR = struct ["VkStructureType  sType",
                                             "void * pNext",
                                             "VkExternalMemoryHandleTypeFlagBits  handleType",
                                             "HANDLE  handle",
                                             "LPCWSTR  name"]

  VkImportMemoryWin32HandleInfoNV = struct ["VkStructureType  sType",
                                            "void * pNext",
                                            "VkExternalMemoryHandleTypeFlagsNV  handleType",
                                            "HANDLE  handle"]

  VkImportMemoryZirconHandleInfoFUCHSIA = struct ["VkStructureType  sType",
                                                  "void * pNext",
                                                  "VkExternalMemoryHandleTypeFlagBits  handleType",
                                                  "zx_handle_t  handle"]

  VkImportSemaphoreFdInfoKHR = struct ["VkStructureType  sType",
                                       "void * pNext",
                                       "VkSemaphore  semaphore",
                                       "VkSemaphoreImportFlags  flags",
                                       "VkExternalSemaphoreHandleTypeFlagBits  handleType",
                                       "int  fd"]

  VkImportSemaphoreWin32HandleInfoKHR = struct ["VkStructureType  sType",
                                                "void * pNext",
                                                "VkSemaphore  semaphore",
                                                "VkSemaphoreImportFlags  flags",
                                                "VkExternalSemaphoreHandleTypeFlagBits  handleType",
                                                "HANDLE  handle",
                                                "LPCWSTR  name"]

  VkImportSemaphoreZirconHandleInfoFUCHSIA = struct ["VkStructureType  sType",
                                                     "void * pNext",
                                                     "VkSemaphore  semaphore",
                                                     "VkSemaphoreImportFlags  flags",
                                                     "VkExternalSemaphoreHandleTypeFlagBits  handleType",
                                                     "zx_handle_t  zirconHandle"]

  VkIndirectCommandsLayoutTokenNV = struct ["VkStructureType  sType",
                                            "void * pNext",
                                            "VkIndirectCommandsTokenTypeNV  tokenType",
                                            "uint32_t  stream",
                                            "uint32_t  offset",
                                            "uint32_t  vertexBindingUnit",
                                            "VkBool32  vertexDynamicStride",
                                            "VkPipelineLayout  pushconstantPipelineLayout",
                                            "VkShaderStageFlags  pushconstantShaderStageFlags",
                                            "uint32_t  pushconstantOffset",
                                            "uint32_t  pushconstantSize",
                                            "VkIndirectStateFlagsNV  indirectStateFlags",
                                            "uint32_t  indexTypeCount",
                                            "VkIndexType * pIndexTypes",
                                            "uint32_t * pIndexTypeValues"]
  VkIndirectCommandsLayoutCreateInfoNV = struct ["VkStructureType  sType",
                                                 "void * pNext",
                                                 "VkIndirectCommandsLayoutUsageFlagsNV  flags",
                                                 "VkPipelineBindPoint  pipelineBindPoint",
                                                 "uint32_t  tokenCount",
                                                 "VkIndirectCommandsLayoutTokenNV * pTokens",
                                                 "uint32_t  streamCount",
                                                 "uint32_t * pStreamStrides"]

  VkInitializePerformanceApiInfoINTEL = struct ["VkStructureType  sType",
                                                "void * pNext",
                                                "void * pUserData"]

  VkInputAttachmentAspectReference = struct ["uint32_t  subpass",
                                             "uint32_t  inputAttachmentIndex",
                                             "VkImageAspectFlags  aspectMask"]

  VkInputAttachmentAspectReferenceKHR = VkInputAttachmentAspectReference

  VkInstanceCreateInfo = struct ["VkStructureType  sType",
                                 "void * pNext",
                                 "VkInstanceCreateFlags  flags",
                                 "VkApplicationInfo * pApplicationInfo",
                                 "uint32_t  enabledLayerCount",
                                 "char * ppEnabledLayerNames",
                                 "uint32_t  enabledExtensionCount",
                                 "char * ppEnabledExtensionNames"]

  VkLayerProperties = struct ["char  layerName[#{VK_MAX_EXTENSION_NAME_SIZE}]",
                              "uint32_t  specVersion",
                              "uint32_t  implementationVersion",
                              "char  description[#{VK_MAX_DESCRIPTION_SIZE}]"]

  VkMacOSSurfaceCreateInfoMVK = struct ["VkStructureType  sType",
                                        "void * pNext",
                                        "VkMacOSSurfaceCreateFlagsMVK  flags",
                                        "void * pView"]

  VkMappedMemoryRange = struct ["VkStructureType  sType",
                                "void * pNext",
                                "VkDeviceMemory  memory",
                                "VkDeviceSize  offset",
                                "VkDeviceSize  size"]

  VkMemoryAllocateFlagsInfo = struct ["VkStructureType  sType",
                                      "void * pNext",
                                      "VkMemoryAllocateFlags  flags",
                                      "uint32_t  deviceMask"]

  VkMemoryAllocateFlagsInfoKHR = VkMemoryAllocateFlagsInfo

  VkMemoryAllocateInfo = struct ["VkStructureType  sType",
                                 "void * pNext",
                                 "VkDeviceSize  allocationSize",
                                 "uint32_t  memoryTypeIndex"]

  VkMemoryBarrier = struct ["VkStructureType  sType",
                            "void * pNext",
                            "VkAccessFlags  srcAccessMask",
                            "VkAccessFlags  dstAccessMask"]

  VkMemoryBarrier2KHR = VkMemoryBarrier2

  VkMemoryDedicatedAllocateInfo = struct ["VkStructureType  sType",
                                          "void * pNext",
                                          "VkImage  image",
                                          "VkBuffer  buffer"]

  VkMemoryDedicatedAllocateInfoKHR = VkMemoryDedicatedAllocateInfo

  VkMemoryDedicatedRequirements = struct ["VkStructureType  sType",
                                          "void * pNext",
                                          "VkBool32  prefersDedicatedAllocation",
                                          "VkBool32  requiresDedicatedAllocation"]

  VkMemoryDedicatedRequirementsKHR = VkMemoryDedicatedRequirements

  VkMemoryFdPropertiesKHR = struct ["VkStructureType  sType",
                                    "void * pNext",
                                    "uint32_t  memoryTypeBits"]

  VkMemoryGetAndroidHardwareBufferInfoANDROID = struct ["VkStructureType  sType",
                                                        "void * pNext",
                                                        "VkDeviceMemory  memory"]

  VkMemoryGetFdInfoKHR = struct ["VkStructureType  sType",
                                 "void * pNext",
                                 "VkDeviceMemory  memory",
                                 "VkExternalMemoryHandleTypeFlagBits  handleType"]

  VkMemoryGetRemoteAddressInfoNV = struct ["VkStructureType  sType",
                                           "void * pNext",
                                           "VkDeviceMemory  memory",
                                           "VkExternalMemoryHandleTypeFlagBits  handleType"]

  VkMemoryGetWin32HandleInfoKHR = struct ["VkStructureType  sType",
                                          "void * pNext",
                                          "VkDeviceMemory  memory",
                                          "VkExternalMemoryHandleTypeFlagBits  handleType"]

  VkMemoryGetZirconHandleInfoFUCHSIA = struct ["VkStructureType  sType",
                                               "void * pNext",
                                               "VkDeviceMemory  memory",
                                               "VkExternalMemoryHandleTypeFlagBits  handleType"]

  VkMemoryHeap = struct ["VkDeviceSize  size",
                         "VkMemoryHeapFlags  flags"]

  VkMemoryHostPointerPropertiesEXT = struct ["VkStructureType  sType",
                                             "void * pNext",
                                             "uint32_t  memoryTypeBits"]

  VkMemoryOpaqueCaptureAddressAllocateInfo = struct ["VkStructureType  sType",
                                                     "void * pNext",
                                                     "uint64_t  opaqueCaptureAddress"]

  VkMemoryOpaqueCaptureAddressAllocateInfoKHR = VkMemoryOpaqueCaptureAddressAllocateInfo

  VkMemoryPriorityAllocateInfoEXT = struct ["VkStructureType  sType",
                                            "void * pNext",
                                            "float  priority"]

  VkMemoryRequirements = struct ["VkDeviceSize  size",
                                 "VkDeviceSize  alignment",
                                 "uint32_t  memoryTypeBits"]

  VkMemoryRequirements2 = struct ["VkStructureType  sType",
                                  "void * pNext",
                                  { "memoryRequirements" => VkMemoryRequirements }]

  VkMemoryRequirements2KHR = VkMemoryRequirements2

  VkMemoryType = struct ["VkMemoryPropertyFlags  propertyFlags",
                         "uint32_t  heapIndex"]

  VkMemoryWin32HandlePropertiesKHR = struct ["VkStructureType  sType",
                                             "void * pNext",
                                             "uint32_t  memoryTypeBits"]

  VkMemoryZirconHandlePropertiesFUCHSIA = struct ["VkStructureType  sType",
                                                  "void * pNext",
                                                  "uint32_t  memoryTypeBits"]

  VkMetalSurfaceCreateInfoEXT = struct ["VkStructureType  sType",
                                        "void * pNext",
                                        "VkMetalSurfaceCreateFlagsEXT  flags",
                                        "CAMetalLayer * pLayer"]

  VkMultiDrawIndexedInfoEXT = struct ["uint32_t  firstIndex",
                                      "uint32_t  indexCount",
                                      "int32_t  vertexOffset"]

  VkMultiDrawInfoEXT = struct ["uint32_t  firstVertex",
                               "uint32_t  vertexCount"]

  VkMultisamplePropertiesEXT = struct ["VkStructureType  sType",
                                       "void * pNext",
                                       { "maxSampleLocationGridSize" => VkExtent2D }]

  VkMultiviewPerViewAttributesInfoNVX = struct ["VkStructureType  sType",
                                                "void * pNext",
                                                "VkBool32  perViewAttributes",
                                                "VkBool32  perViewAttributesPositionXOnly"]

  VkMutableDescriptorTypeListVALVE = struct ["uint32_t  descriptorTypeCount",
                                             "VkDescriptorType * pDescriptorTypes"]
  VkMutableDescriptorTypeCreateInfoVALVE = struct ["VkStructureType  sType",
                                                   "void * pNext",
                                                   "uint32_t  mutableDescriptorTypeListCount",
                                                   "VkMutableDescriptorTypeListVALVE * pMutableDescriptorTypeLists"]

  VkNativeBufferUsage2ANDROID = struct ["uint64_t  consumer",
                                        "uint64_t  producer"]
  VkNativeBufferANDROID = struct ["VkStructureType  sType",
                                  "void * pNext",
                                  "void * handle",
                                  "int  stride",
                                  "int  format",
                                  "int  usage",
                                  { "usage2" => VkNativeBufferUsage2ANDROID }]

  VkPastPresentationTimingGOOGLE = struct ["uint32_t  presentID",
                                           "uint64_t  desiredPresentTime",
                                           "uint64_t  actualPresentTime",
                                           "uint64_t  earliestPresentTime",
                                           "uint64_t  presentMargin"]

  VkPerformanceConfigurationAcquireInfoINTEL = struct ["VkStructureType  sType",
                                                       "void * pNext",
                                                       "VkPerformanceConfigurationTypeINTEL  type"]

  VkPerformanceCounterDescriptionKHR = struct ["VkStructureType  sType",
                                               "void * pNext",
                                               "VkPerformanceCounterDescriptionFlagsKHR  flags",
                                               "char  name[#{VK_MAX_DESCRIPTION_SIZE}]",
                                               "char  category[#{VK_MAX_DESCRIPTION_SIZE}]",
                                               "char  description[#{VK_MAX_DESCRIPTION_SIZE}]"]

  VkPerformanceCounterKHR = struct ["VkStructureType  sType",
                                    "void * pNext",
                                    "VkPerformanceCounterUnitKHR  unit",
                                    "VkPerformanceCounterScopeKHR  scope",
                                    "VkPerformanceCounterStorageKHR  storage",
                                    "uint8_t  uuid[#{VK_UUID_SIZE}]"]

  # Union of all the possible return types a counter result could return
  VkPerformanceCounterResultKHR = union ["int32_t  int32",
                                         "int64_t  int64",
                                         "uint32_t  uint32",
                                         "uint64_t  uint64",
                                         "float  float32",
                                         "double  float64"]

  VkPerformanceMarkerInfoINTEL = struct ["VkStructureType  sType",
                                         "void * pNext",
                                         "uint64_t  marker"]

  VkPerformanceOverrideInfoINTEL = struct ["VkStructureType  sType",
                                           "void * pNext",
                                           "VkPerformanceOverrideTypeINTEL  type",
                                           "VkBool32  enable",
                                           "uint64_t  parameter"]

  VkPerformanceQuerySubmitInfoKHR = struct ["VkStructureType  sType",
                                            "void * pNext",
                                            "uint32_t  counterPassIndex"]

  VkPerformanceStreamMarkerInfoINTEL = struct ["VkStructureType  sType",
                                               "void * pNext",
                                               "uint32_t  marker"]

  VkPerformanceValueDataINTEL = union ["uint32_t  value32",
                                       "uint64_t  value64",
                                       "float  valueFloat",
                                       "VkBool32  valueBool",
                                       "char * valueString"]

  VkPerformanceValueINTEL = struct ["VkPerformanceValueTypeINTEL  type",
                                    { "data" => VkPerformanceValueDataINTEL }]

  VkPhysicalDevice16BitStorageFeatures = struct ["VkStructureType  sType",
                                                 "void * pNext",
                                                 "VkBool32  storageBuffer16BitAccess",
                                                 "VkBool32  uniformAndStorageBuffer16BitAccess",
                                                 "VkBool32  storagePushConstant16",
                                                 "VkBool32  storageInputOutput16"]

  VkPhysicalDevice16BitStorageFeaturesKHR = VkPhysicalDevice16BitStorageFeatures

  VkPhysicalDevice4444FormatsFeaturesEXT = struct ["VkStructureType  sType",
                                                   "void * pNext",
                                                   "VkBool32  formatA4R4G4B4",
                                                   "VkBool32  formatA4B4G4R4"]

  VkPhysicalDevice8BitStorageFeatures = struct ["VkStructureType  sType",
                                                "void * pNext",
                                                "VkBool32  storageBuffer8BitAccess",
                                                "VkBool32  uniformAndStorageBuffer8BitAccess",
                                                "VkBool32  storagePushConstant8"]

  VkPhysicalDevice8BitStorageFeaturesKHR = VkPhysicalDevice8BitStorageFeatures

  VkPhysicalDeviceASTCDecodeFeaturesEXT = struct ["VkStructureType  sType",
                                                  "void * pNext",
                                                  "VkBool32  decodeModeSharedExponent"]

  VkPhysicalDeviceAccelerationStructureFeaturesKHR = struct ["VkStructureType  sType",
                                                             "void * pNext",
                                                             "VkBool32  accelerationStructure",
                                                             "VkBool32  accelerationStructureCaptureReplay",
                                                             "VkBool32  accelerationStructureIndirectBuild",
                                                             "VkBool32  accelerationStructureHostCommands",
                                                             "VkBool32  descriptorBindingAccelerationStructureUpdateAfterBind"]

  VkPhysicalDeviceAccelerationStructurePropertiesKHR = struct ["VkStructureType  sType",
                                                               "void * pNext",
                                                               "uint64_t  maxGeometryCount",
                                                               "uint64_t  maxInstanceCount",
                                                               "uint64_t  maxPrimitiveCount",
                                                               "uint32_t  maxPerStageDescriptorAccelerationStructures",
                                                               "uint32_t  maxPerStageDescriptorUpdateAfterBindAccelerationStructures",
                                                               "uint32_t  maxDescriptorSetAccelerationStructures",
                                                               "uint32_t  maxDescriptorSetUpdateAfterBindAccelerationStructures",
                                                               "uint32_t  minAccelerationStructureScratchOffsetAlignment"]

  VkPhysicalDeviceBlendOperationAdvancedFeaturesEXT = struct ["VkStructureType  sType",
                                                              "void * pNext",
                                                              "VkBool32  advancedBlendCoherentOperations"]

  VkPhysicalDeviceBlendOperationAdvancedPropertiesEXT = struct ["VkStructureType  sType",
                                                                "void * pNext",
                                                                "uint32_t  advancedBlendMaxColorAttachments",
                                                                "VkBool32  advancedBlendIndependentBlend",
                                                                "VkBool32  advancedBlendNonPremultipliedSrcColor",
                                                                "VkBool32  advancedBlendNonPremultipliedDstColor",
                                                                "VkBool32  advancedBlendCorrelatedOverlap",
                                                                "VkBool32  advancedBlendAllOperations"]

  VkPhysicalDeviceBorderColorSwizzleFeaturesEXT = struct ["VkStructureType  sType",
                                                          "void * pNext",
                                                          "VkBool32  borderColorSwizzle",
                                                          "VkBool32  borderColorSwizzleFromImage"]

  VkPhysicalDeviceBufferDeviceAddressFeaturesEXT = struct ["VkStructureType  sType",
                                                           "void * pNext",
                                                           "VkBool32  bufferDeviceAddress",
                                                           "VkBool32  bufferDeviceAddressCaptureReplay",
                                                           "VkBool32  bufferDeviceAddressMultiDevice"]
  VkPhysicalDeviceBufferAddressFeaturesEXT = VkPhysicalDeviceBufferDeviceAddressFeaturesEXT

  VkPhysicalDeviceBufferDeviceAddressFeatures = struct ["VkStructureType  sType",
                                                        "void * pNext",
                                                        "VkBool32  bufferDeviceAddress",
                                                        "VkBool32  bufferDeviceAddressCaptureReplay",
                                                        "VkBool32  bufferDeviceAddressMultiDevice"]

  VkPhysicalDeviceBufferDeviceAddressFeaturesKHR = VkPhysicalDeviceBufferDeviceAddressFeatures

  VkPhysicalDeviceCoherentMemoryFeaturesAMD = struct ["VkStructureType  sType",
                                                      "void * pNext",
                                                      "VkBool32  deviceCoherentMemory"]

  VkPhysicalDeviceColorWriteEnableFeaturesEXT = struct ["VkStructureType  sType",
                                                        "void * pNext",
                                                        "VkBool32  colorWriteEnable"]

  VkPhysicalDeviceComputeShaderDerivativesFeaturesNV = struct ["VkStructureType  sType",
                                                               "void * pNext",
                                                               "VkBool32  computeDerivativeGroupQuads",
                                                               "VkBool32  computeDerivativeGroupLinear"]

  VkPhysicalDeviceConditionalRenderingFeaturesEXT = struct ["VkStructureType  sType",
                                                            "void * pNext",
                                                            "VkBool32  conditionalRendering",
                                                            "VkBool32  inheritedConditionalRendering"]

  VkPhysicalDeviceConservativeRasterizationPropertiesEXT = struct ["VkStructureType  sType",
                                                                   "void * pNext",
                                                                   "float  primitiveOverestimationSize",
                                                                   "float  maxExtraPrimitiveOverestimationSize",
                                                                   "float  extraPrimitiveOverestimationSizeGranularity",
                                                                   "VkBool32  primitiveUnderestimation",
                                                                   "VkBool32  conservativePointAndLineRasterization",
                                                                   "VkBool32  degenerateTrianglesRasterized",
                                                                   "VkBool32  degenerateLinesRasterized",
                                                                   "VkBool32  fullyCoveredFragmentShaderInputVariable",
                                                                   "VkBool32  conservativeRasterizationPostDepthCoverage"]

  VkPhysicalDeviceCooperativeMatrixFeaturesNV = struct ["VkStructureType  sType",
                                                        "void * pNext",
                                                        "VkBool32  cooperativeMatrix",
                                                        "VkBool32  cooperativeMatrixRobustBufferAccess"]

  VkPhysicalDeviceCooperativeMatrixPropertiesNV = struct ["VkStructureType  sType",
                                                          "void * pNext",
                                                          "VkShaderStageFlags  cooperativeMatrixSupportedStages"]

  VkPhysicalDeviceCornerSampledImageFeaturesNV = struct ["VkStructureType  sType",
                                                         "void * pNext",
                                                         "VkBool32  cornerSampledImage"]

  VkPhysicalDeviceCoverageReductionModeFeaturesNV = struct ["VkStructureType  sType",
                                                            "void * pNext",
                                                            "VkBool32  coverageReductionMode"]

  VkPhysicalDeviceCustomBorderColorFeaturesEXT = struct ["VkStructureType  sType",
                                                         "void * pNext",
                                                         "VkBool32  customBorderColors",
                                                         "VkBool32  customBorderColorWithoutFormat"]

  VkPhysicalDeviceCustomBorderColorPropertiesEXT = struct ["VkStructureType  sType",
                                                           "void * pNext",
                                                           "uint32_t  maxCustomBorderColorSamplers"]

  VkPhysicalDeviceDedicatedAllocationImageAliasingFeaturesNV = struct ["VkStructureType  sType",
                                                                       "void * pNext",
                                                                       "VkBool32  dedicatedAllocationImageAliasing"]

  VkPhysicalDeviceDepthClipControlFeaturesEXT = struct ["VkStructureType  sType",
                                                        "void * pNext",
                                                        "VkBool32  depthClipControl"]

  VkPhysicalDeviceDepthClipEnableFeaturesEXT = struct ["VkStructureType  sType",
                                                       "void * pNext",
                                                       "VkBool32  depthClipEnable"]

  VkPhysicalDeviceDepthStencilResolveProperties = struct ["VkStructureType  sType",
                                                          "void * pNext",
                                                          "VkResolveModeFlags  supportedDepthResolveModes",
                                                          "VkResolveModeFlags  supportedStencilResolveModes",
                                                          "VkBool32  independentResolveNone",
                                                          "VkBool32  independentResolve"]

  VkPhysicalDeviceDepthStencilResolvePropertiesKHR = VkPhysicalDeviceDepthStencilResolveProperties

  VkPhysicalDeviceDescriptorIndexingFeatures = struct ["VkStructureType  sType",
                                                       "void * pNext",
                                                       "VkBool32  shaderInputAttachmentArrayDynamicIndexing",
                                                       "VkBool32  shaderUniformTexelBufferArrayDynamicIndexing",
                                                       "VkBool32  shaderStorageTexelBufferArrayDynamicIndexing",
                                                       "VkBool32  shaderUniformBufferArrayNonUniformIndexing",
                                                       "VkBool32  shaderSampledImageArrayNonUniformIndexing",
                                                       "VkBool32  shaderStorageBufferArrayNonUniformIndexing",
                                                       "VkBool32  shaderStorageImageArrayNonUniformIndexing",
                                                       "VkBool32  shaderInputAttachmentArrayNonUniformIndexing",
                                                       "VkBool32  shaderUniformTexelBufferArrayNonUniformIndexing",
                                                       "VkBool32  shaderStorageTexelBufferArrayNonUniformIndexing",
                                                       "VkBool32  descriptorBindingUniformBufferUpdateAfterBind",
                                                       "VkBool32  descriptorBindingSampledImageUpdateAfterBind",
                                                       "VkBool32  descriptorBindingStorageImageUpdateAfterBind",
                                                       "VkBool32  descriptorBindingStorageBufferUpdateAfterBind",
                                                       "VkBool32  descriptorBindingUniformTexelBufferUpdateAfterBind",
                                                       "VkBool32  descriptorBindingStorageTexelBufferUpdateAfterBind",
                                                       "VkBool32  descriptorBindingUpdateUnusedWhilePending",
                                                       "VkBool32  descriptorBindingPartiallyBound",
                                                       "VkBool32  descriptorBindingVariableDescriptorCount",
                                                       "VkBool32  runtimeDescriptorArray"]

  VkPhysicalDeviceDescriptorIndexingFeaturesEXT = VkPhysicalDeviceDescriptorIndexingFeatures

  VkPhysicalDeviceDescriptorIndexingProperties = struct ["VkStructureType  sType",
                                                         "void * pNext",
                                                         "uint32_t  maxUpdateAfterBindDescriptorsInAllPools",
                                                         "VkBool32  shaderUniformBufferArrayNonUniformIndexingNative",
                                                         "VkBool32  shaderSampledImageArrayNonUniformIndexingNative",
                                                         "VkBool32  shaderStorageBufferArrayNonUniformIndexingNative",
                                                         "VkBool32  shaderStorageImageArrayNonUniformIndexingNative",
                                                         "VkBool32  shaderInputAttachmentArrayNonUniformIndexingNative",
                                                         "VkBool32  robustBufferAccessUpdateAfterBind",
                                                         "VkBool32  quadDivergentImplicitLod",
                                                         "uint32_t  maxPerStageDescriptorUpdateAfterBindSamplers",
                                                         "uint32_t  maxPerStageDescriptorUpdateAfterBindUniformBuffers",
                                                         "uint32_t  maxPerStageDescriptorUpdateAfterBindStorageBuffers",
                                                         "uint32_t  maxPerStageDescriptorUpdateAfterBindSampledImages",
                                                         "uint32_t  maxPerStageDescriptorUpdateAfterBindStorageImages",
                                                         "uint32_t  maxPerStageDescriptorUpdateAfterBindInputAttachments",
                                                         "uint32_t  maxPerStageUpdateAfterBindResources",
                                                         "uint32_t  maxDescriptorSetUpdateAfterBindSamplers",
                                                         "uint32_t  maxDescriptorSetUpdateAfterBindUniformBuffers",
                                                         "uint32_t  maxDescriptorSetUpdateAfterBindUniformBuffersDynamic",
                                                         "uint32_t  maxDescriptorSetUpdateAfterBindStorageBuffers",
                                                         "uint32_t  maxDescriptorSetUpdateAfterBindStorageBuffersDynamic",
                                                         "uint32_t  maxDescriptorSetUpdateAfterBindSampledImages",
                                                         "uint32_t  maxDescriptorSetUpdateAfterBindStorageImages",
                                                         "uint32_t  maxDescriptorSetUpdateAfterBindInputAttachments"]

  VkPhysicalDeviceDescriptorIndexingPropertiesEXT = VkPhysicalDeviceDescriptorIndexingProperties

  VkPhysicalDeviceDescriptorSetHostMappingFeaturesVALVE = struct ["VkStructureType  sType",
                                                                  "void * pNext",
                                                                  "VkBool32  descriptorSetHostMapping"]

  VkPhysicalDeviceDeviceGeneratedCommandsFeaturesNV = struct ["VkStructureType  sType",
                                                              "void * pNext",
                                                              "VkBool32  deviceGeneratedCommands"]

  VkPhysicalDeviceDeviceGeneratedCommandsPropertiesNV = struct ["VkStructureType  sType",
                                                                "void * pNext",
                                                                "uint32_t  maxGraphicsShaderGroupCount",
                                                                "uint32_t  maxIndirectSequenceCount",
                                                                "uint32_t  maxIndirectCommandsTokenCount",
                                                                "uint32_t  maxIndirectCommandsStreamCount",
                                                                "uint32_t  maxIndirectCommandsTokenOffset",
                                                                "uint32_t  maxIndirectCommandsStreamStride",
                                                                "uint32_t  minSequencesCountBufferOffsetAlignment",
                                                                "uint32_t  minSequencesIndexBufferOffsetAlignment",
                                                                "uint32_t  minIndirectCommandsBufferOffsetAlignment"]

  VkPhysicalDeviceDeviceMemoryReportFeaturesEXT = struct ["VkStructureType  sType",
                                                          "void * pNext",
                                                          "VkBool32  deviceMemoryReport"]

  VkPhysicalDeviceDiagnosticsConfigFeaturesNV = struct ["VkStructureType  sType",
                                                        "void * pNext",
                                                        "VkBool32  diagnosticsConfig"]

  VkPhysicalDeviceDiscardRectanglePropertiesEXT = struct ["VkStructureType  sType",
                                                          "void * pNext",
                                                          "uint32_t  maxDiscardRectangles"]

  VkPhysicalDeviceDriverProperties = struct ["VkStructureType  sType",
                                             "void * pNext",
                                             "VkDriverId  driverID",
                                             "char  driverName[#{VK_MAX_DRIVER_NAME_SIZE}]",
                                             "char  driverInfo[#{VK_MAX_DRIVER_INFO_SIZE}]",
                                             { "conformanceVersion" => VkConformanceVersion }]

  VkPhysicalDeviceDriverPropertiesKHR = VkPhysicalDeviceDriverProperties

  VkPhysicalDeviceDrmPropertiesEXT = struct ["VkStructureType  sType",
                                             "void * pNext",
                                             "VkBool32  hasPrimary",
                                             "VkBool32  hasRender",
                                             "int64_t  primaryMajor",
                                             "int64_t  primaryMinor",
                                             "int64_t  renderMajor",
                                             "int64_t  renderMinor"]

  VkPhysicalDeviceDynamicRenderingFeatures = struct ["VkStructureType  sType",
                                                     "void * pNext",
                                                     "VkBool32  dynamicRendering"]

  VkPhysicalDeviceDynamicRenderingFeaturesKHR = VkPhysicalDeviceDynamicRenderingFeatures

  VkPhysicalDeviceExclusiveScissorFeaturesNV = struct ["VkStructureType  sType",
                                                       "void * pNext",
                                                       "VkBool32  exclusiveScissor"]

  VkPhysicalDeviceExtendedDynamicState2FeaturesEXT = struct ["VkStructureType  sType",
                                                             "void * pNext",
                                                             "VkBool32  extendedDynamicState2",
                                                             "VkBool32  extendedDynamicState2LogicOp",
                                                             "VkBool32  extendedDynamicState2PatchControlPoints"]

  VkPhysicalDeviceExtendedDynamicStateFeaturesEXT = struct ["VkStructureType  sType",
                                                            "void * pNext",
                                                            "VkBool32  extendedDynamicState"]

  VkPhysicalDeviceExternalBufferInfo = struct ["VkStructureType  sType",
                                               "void * pNext",
                                               "VkBufferCreateFlags  flags",
                                               "VkBufferUsageFlags  usage",
                                               "VkExternalMemoryHandleTypeFlagBits  handleType"]

  VkPhysicalDeviceExternalBufferInfoKHR = VkPhysicalDeviceExternalBufferInfo

  VkPhysicalDeviceExternalFenceInfo = struct ["VkStructureType  sType",
                                              "void * pNext",
                                              "VkExternalFenceHandleTypeFlagBits  handleType"]

  VkPhysicalDeviceExternalFenceInfoKHR = VkPhysicalDeviceExternalFenceInfo

  VkPhysicalDeviceExternalImageFormatInfo = struct ["VkStructureType  sType",
                                                    "void * pNext",
                                                    "VkExternalMemoryHandleTypeFlagBits  handleType"]

  VkPhysicalDeviceExternalImageFormatInfoKHR = VkPhysicalDeviceExternalImageFormatInfo

  VkPhysicalDeviceExternalMemoryHostPropertiesEXT = struct ["VkStructureType  sType",
                                                            "void * pNext",
                                                            "VkDeviceSize  minImportedHostPointerAlignment"]

  VkPhysicalDeviceExternalMemoryRDMAFeaturesNV = struct ["VkStructureType  sType",
                                                         "void * pNext",
                                                         "VkBool32  externalMemoryRDMA"]

  VkPhysicalDeviceExternalSemaphoreInfo = struct ["VkStructureType  sType",
                                                  "void * pNext",
                                                  "VkExternalSemaphoreHandleTypeFlagBits  handleType"]

  VkPhysicalDeviceExternalSemaphoreInfoKHR = VkPhysicalDeviceExternalSemaphoreInfo

  VkPhysicalDeviceFeatures2 = struct ["VkStructureType  sType",
                                      "void * pNext",
                                      { "features" => VkPhysicalDeviceFeatures }]

  VkPhysicalDeviceFeatures2KHR = VkPhysicalDeviceFeatures2

  VkPhysicalDeviceShaderFloat16Int8Features = struct ["VkStructureType  sType",
                                                      "void * pNext",
                                                      "VkBool32  shaderFloat16",
                                                      "VkBool32  shaderInt8"]
  VkPhysicalDeviceFloat16Int8FeaturesKHR = VkPhysicalDeviceShaderFloat16Int8Features

  VkPhysicalDeviceFloatControlsProperties = struct ["VkStructureType  sType",
                                                    "void * pNext",
                                                    "VkShaderFloatControlsIndependence  denormBehaviorIndependence",
                                                    "VkShaderFloatControlsIndependence  roundingModeIndependence",
                                                    "VkBool32  shaderSignedZeroInfNanPreserveFloat16",
                                                    "VkBool32  shaderSignedZeroInfNanPreserveFloat32",
                                                    "VkBool32  shaderSignedZeroInfNanPreserveFloat64",
                                                    "VkBool32  shaderDenormPreserveFloat16",
                                                    "VkBool32  shaderDenormPreserveFloat32",
                                                    "VkBool32  shaderDenormPreserveFloat64",
                                                    "VkBool32  shaderDenormFlushToZeroFloat16",
                                                    "VkBool32  shaderDenormFlushToZeroFloat32",
                                                    "VkBool32  shaderDenormFlushToZeroFloat64",
                                                    "VkBool32  shaderRoundingModeRTEFloat16",
                                                    "VkBool32  shaderRoundingModeRTEFloat32",
                                                    "VkBool32  shaderRoundingModeRTEFloat64",
                                                    "VkBool32  shaderRoundingModeRTZFloat16",
                                                    "VkBool32  shaderRoundingModeRTZFloat32",
                                                    "VkBool32  shaderRoundingModeRTZFloat64"]

  VkPhysicalDeviceFloatControlsPropertiesKHR = VkPhysicalDeviceFloatControlsProperties

  VkPhysicalDeviceFragmentDensityMap2FeaturesEXT = struct ["VkStructureType  sType",
                                                           "void * pNext",
                                                           "VkBool32  fragmentDensityMapDeferred"]

  VkPhysicalDeviceFragmentDensityMap2PropertiesEXT = struct ["VkStructureType  sType",
                                                             "void * pNext",
                                                             "VkBool32  subsampledLoads",
                                                             "VkBool32  subsampledCoarseReconstructionEarlyAccess",
                                                             "uint32_t  maxSubsampledArrayLayers",
                                                             "uint32_t  maxDescriptorSetSubsampledSamplers"]

  VkPhysicalDeviceFragmentDensityMapFeaturesEXT = struct ["VkStructureType  sType",
                                                          "void * pNext",
                                                          "VkBool32  fragmentDensityMap",
                                                          "VkBool32  fragmentDensityMapDynamic",
                                                          "VkBool32  fragmentDensityMapNonSubsampledImages"]

  VkPhysicalDeviceFragmentDensityMapOffsetFeaturesQCOM = struct ["VkStructureType  sType",
                                                                 "void * pNext",
                                                                 "VkBool32  fragmentDensityMapOffset"]

  VkPhysicalDeviceFragmentDensityMapOffsetPropertiesQCOM = struct ["VkStructureType  sType",
                                                                   "void * pNext",
                                                                   { "fragmentDensityOffsetGranularity" => VkExtent2D }]

  VkPhysicalDeviceFragmentDensityMapPropertiesEXT = struct ["VkStructureType  sType",
                                                            "void * pNext",
                                                            { "minFragmentDensityTexelSize" => VkExtent2D },
                                                            { "maxFragmentDensityTexelSize" => VkExtent2D },
                                                            "VkBool32  fragmentDensityInvocations"]

  VkPhysicalDeviceFragmentShaderBarycentricFeaturesNV = struct ["VkStructureType  sType",
                                                                "void * pNext",
                                                                "VkBool32  fragmentShaderBarycentric"]

  VkPhysicalDeviceFragmentShaderInterlockFeaturesEXT = struct ["VkStructureType  sType",
                                                               "void * pNext",
                                                               "VkBool32  fragmentShaderSampleInterlock",
                                                               "VkBool32  fragmentShaderPixelInterlock",
                                                               "VkBool32  fragmentShaderShadingRateInterlock"]

  VkPhysicalDeviceFragmentShadingRateEnumsFeaturesNV = struct ["VkStructureType  sType",
                                                               "void * pNext",
                                                               "VkBool32  fragmentShadingRateEnums",
                                                               "VkBool32  supersampleFragmentShadingRates",
                                                               "VkBool32  noInvocationFragmentShadingRates"]

  VkPhysicalDeviceFragmentShadingRateEnumsPropertiesNV = struct ["VkStructureType  sType",
                                                                 "void * pNext",
                                                                 "VkSampleCountFlagBits  maxFragmentShadingRateInvocationCount"]

  VkPhysicalDeviceFragmentShadingRateFeaturesKHR = struct ["VkStructureType  sType",
                                                           "void * pNext",
                                                           "VkBool32  pipelineFragmentShadingRate",
                                                           "VkBool32  primitiveFragmentShadingRate",
                                                           "VkBool32  attachmentFragmentShadingRate"]

  VkPhysicalDeviceFragmentShadingRateKHR = struct ["VkStructureType  sType",
                                                   "void * pNext",
                                                   "VkSampleCountFlags  sampleCounts",
                                                   { "fragmentSize" => VkExtent2D }]

  VkPhysicalDeviceFragmentShadingRatePropertiesKHR = struct ["VkStructureType  sType",
                                                             "void * pNext",
                                                             { "minFragmentShadingRateAttachmentTexelSize" => VkExtent2D },
                                                             { "maxFragmentShadingRateAttachmentTexelSize" => VkExtent2D },
                                                             "uint32_t  maxFragmentShadingRateAttachmentTexelSizeAspectRatio",
                                                             "VkBool32  primitiveFragmentShadingRateWithMultipleViewports",
                                                             "VkBool32  layeredShadingRateAttachments",
                                                             "VkBool32  fragmentShadingRateNonTrivialCombinerOps",
                                                             { "maxFragmentSize" => VkExtent2D },
                                                             "uint32_t  maxFragmentSizeAspectRatio",
                                                             "uint32_t  maxFragmentShadingRateCoverageSamples",
                                                             "VkSampleCountFlagBits  maxFragmentShadingRateRasterizationSamples",
                                                             "VkBool32  fragmentShadingRateWithShaderDepthStencilWrites",
                                                             "VkBool32  fragmentShadingRateWithSampleMask",
                                                             "VkBool32  fragmentShadingRateWithShaderSampleMask",
                                                             "VkBool32  fragmentShadingRateWithConservativeRasterization",
                                                             "VkBool32  fragmentShadingRateWithFragmentShaderInterlock",
                                                             "VkBool32  fragmentShadingRateWithCustomSampleLocations",
                                                             "VkBool32  fragmentShadingRateStrictMultiplyCombiner"]

  VkPhysicalDeviceGlobalPriorityQueryFeaturesKHR = struct ["VkStructureType  sType",
                                                           "void * pNext",
                                                           "VkBool32  globalPriorityQuery"]
  VkPhysicalDeviceGlobalPriorityQueryFeaturesEXT = VkPhysicalDeviceGlobalPriorityQueryFeaturesKHR

  VkPhysicalDeviceGroupProperties = struct ["VkStructureType  sType",
                                            "void * pNext",
                                            "uint32_t  physicalDeviceCount",
                                            "VkPhysicalDevice  physicalDevices[#{VK_MAX_DEVICE_GROUP_SIZE}]",
                                            "VkBool32  subsetAllocation"]

  VkPhysicalDeviceGroupPropertiesKHR = VkPhysicalDeviceGroupProperties

  VkPhysicalDeviceHostQueryResetFeatures = struct ["VkStructureType  sType",
                                                   "void * pNext",
                                                   "VkBool32  hostQueryReset"]

  VkPhysicalDeviceHostQueryResetFeaturesEXT = VkPhysicalDeviceHostQueryResetFeatures

  VkPhysicalDeviceIDProperties = struct ["VkStructureType  sType",
                                         "void * pNext",
                                         "uint8_t  deviceUUID[#{VK_UUID_SIZE}]",
                                         "uint8_t  driverUUID[#{VK_UUID_SIZE}]",
                                         "uint8_t  deviceLUID[#{VK_LUID_SIZE}]",
                                         "uint32_t  deviceNodeMask",
                                         "VkBool32  deviceLUIDValid"]

  VkPhysicalDeviceIDPropertiesKHR = VkPhysicalDeviceIDProperties

  VkPhysicalDeviceImageDrmFormatModifierInfoEXT = struct ["VkStructureType  sType",
                                                          "void * pNext",
                                                          "uint64_t  drmFormatModifier",
                                                          "VkSharingMode  sharingMode",
                                                          "uint32_t  queueFamilyIndexCount",
                                                          "uint32_t * pQueueFamilyIndices"]

  VkPhysicalDeviceImageFormatInfo2 = struct ["VkStructureType  sType",
                                             "void * pNext",
                                             "VkFormat  format",
                                             "VkImageType  type",
                                             "VkImageTiling  tiling",
                                             "VkImageUsageFlags  usage",
                                             "VkImageCreateFlags  flags"]

  VkPhysicalDeviceImageFormatInfo2KHR = VkPhysicalDeviceImageFormatInfo2

  VkPhysicalDeviceImageRobustnessFeatures = struct ["VkStructureType  sType",
                                                    "void * pNext",
                                                    "VkBool32  robustImageAccess"]

  VkPhysicalDeviceImageRobustnessFeaturesEXT = VkPhysicalDeviceImageRobustnessFeatures

  VkPhysicalDeviceImageViewImageFormatInfoEXT = struct ["VkStructureType  sType",
                                                        "void * pNext",
                                                        "VkImageViewType  imageViewType"]

  VkPhysicalDeviceImageViewMinLodFeaturesEXT = struct ["VkStructureType  sType",
                                                       "void * pNext",
                                                       "VkBool32  minLod"]

  VkPhysicalDeviceImagelessFramebufferFeatures = struct ["VkStructureType  sType",
                                                         "void * pNext",
                                                         "VkBool32  imagelessFramebuffer"]

  VkPhysicalDeviceImagelessFramebufferFeaturesKHR = VkPhysicalDeviceImagelessFramebufferFeatures

  VkPhysicalDeviceIndexTypeUint8FeaturesEXT = struct ["VkStructureType  sType",
                                                      "void * pNext",
                                                      "VkBool32  indexTypeUint8"]

  VkPhysicalDeviceInheritedViewportScissorFeaturesNV = struct ["VkStructureType  sType",
                                                               "void * pNext",
                                                               "VkBool32  inheritedViewportScissor2D"]

  VkPhysicalDeviceInlineUniformBlockFeatures = struct ["VkStructureType  sType",
                                                       "void * pNext",
                                                       "VkBool32  inlineUniformBlock",
                                                       "VkBool32  descriptorBindingInlineUniformBlockUpdateAfterBind"]

  VkPhysicalDeviceInlineUniformBlockFeaturesEXT = VkPhysicalDeviceInlineUniformBlockFeatures

  VkPhysicalDeviceInlineUniformBlockProperties = struct ["VkStructureType  sType",
                                                         "void * pNext",
                                                         "uint32_t  maxInlineUniformBlockSize",
                                                         "uint32_t  maxPerStageDescriptorInlineUniformBlocks",
                                                         "uint32_t  maxPerStageDescriptorUpdateAfterBindInlineUniformBlocks",
                                                         "uint32_t  maxDescriptorSetInlineUniformBlocks",
                                                         "uint32_t  maxDescriptorSetUpdateAfterBindInlineUniformBlocks"]

  VkPhysicalDeviceInlineUniformBlockPropertiesEXT = VkPhysicalDeviceInlineUniformBlockProperties

  VkPhysicalDeviceInvocationMaskFeaturesHUAWEI = struct ["VkStructureType  sType",
                                                         "void * pNext",
                                                         "VkBool32  invocationMask"]

  VkPhysicalDeviceLimits = struct ["uint32_t  maxImageDimension1D",
                                   "uint32_t  maxImageDimension2D",
                                   "uint32_t  maxImageDimension3D",
                                   "uint32_t  maxImageDimensionCube",
                                   "uint32_t  maxImageArrayLayers",
                                   "uint32_t  maxTexelBufferElements",
                                   "uint32_t  maxUniformBufferRange",
                                   "uint32_t  maxStorageBufferRange",
                                   "uint32_t  maxPushConstantsSize",
                                   "uint32_t  maxMemoryAllocationCount",
                                   "uint32_t  maxSamplerAllocationCount",
                                   "VkDeviceSize  bufferImageGranularity",
                                   "VkDeviceSize  sparseAddressSpaceSize",
                                   "uint32_t  maxBoundDescriptorSets",
                                   "uint32_t  maxPerStageDescriptorSamplers",
                                   "uint32_t  maxPerStageDescriptorUniformBuffers",
                                   "uint32_t  maxPerStageDescriptorStorageBuffers",
                                   "uint32_t  maxPerStageDescriptorSampledImages",
                                   "uint32_t  maxPerStageDescriptorStorageImages",
                                   "uint32_t  maxPerStageDescriptorInputAttachments",
                                   "uint32_t  maxPerStageResources",
                                   "uint32_t  maxDescriptorSetSamplers",
                                   "uint32_t  maxDescriptorSetUniformBuffers",
                                   "uint32_t  maxDescriptorSetUniformBuffersDynamic",
                                   "uint32_t  maxDescriptorSetStorageBuffers",
                                   "uint32_t  maxDescriptorSetStorageBuffersDynamic",
                                   "uint32_t  maxDescriptorSetSampledImages",
                                   "uint32_t  maxDescriptorSetStorageImages",
                                   "uint32_t  maxDescriptorSetInputAttachments",
                                   "uint32_t  maxVertexInputAttributes",
                                   "uint32_t  maxVertexInputBindings",
                                   "uint32_t  maxVertexInputAttributeOffset",
                                   "uint32_t  maxVertexInputBindingStride",
                                   "uint32_t  maxVertexOutputComponents",
                                   "uint32_t  maxTessellationGenerationLevel",
                                   "uint32_t  maxTessellationPatchSize",
                                   "uint32_t  maxTessellationControlPerVertexInputComponents",
                                   "uint32_t  maxTessellationControlPerVertexOutputComponents",
                                   "uint32_t  maxTessellationControlPerPatchOutputComponents",
                                   "uint32_t  maxTessellationControlTotalOutputComponents",
                                   "uint32_t  maxTessellationEvaluationInputComponents",
                                   "uint32_t  maxTessellationEvaluationOutputComponents",
                                   "uint32_t  maxGeometryShaderInvocations",
                                   "uint32_t  maxGeometryInputComponents",
                                   "uint32_t  maxGeometryOutputComponents",
                                   "uint32_t  maxGeometryOutputVertices",
                                   "uint32_t  maxGeometryTotalOutputComponents",
                                   "uint32_t  maxFragmentInputComponents",
                                   "uint32_t  maxFragmentOutputAttachments",
                                   "uint32_t  maxFragmentDualSrcAttachments",
                                   "uint32_t  maxFragmentCombinedOutputResources",
                                   "uint32_t  maxComputeSharedMemorySize",
                                   "uint32_t  maxComputeWorkGroupCount [3]",
                                   "uint32_t  maxComputeWorkGroupInvocations",
                                   "uint32_t  maxComputeWorkGroupSize [3]",
                                   "uint32_t  subPixelPrecisionBits",
                                   "uint32_t  subTexelPrecisionBits",
                                   "uint32_t  mipmapPrecisionBits",
                                   "uint32_t  maxDrawIndexedIndexValue",
                                   "uint32_t  maxDrawIndirectCount",
                                   "float  maxSamplerLodBias",
                                   "float  maxSamplerAnisotropy",
                                   "uint32_t  maxViewports",
                                   "uint32_t  maxViewportDimensions [2]",
                                   "float  viewportBoundsRange [2]",
                                   "uint32_t  viewportSubPixelBits",
                                   "size_t  minMemoryMapAlignment",
                                   "VkDeviceSize  minTexelBufferOffsetAlignment",
                                   "VkDeviceSize  minUniformBufferOffsetAlignment",
                                   "VkDeviceSize  minStorageBufferOffsetAlignment",
                                   "int32_t  minTexelOffset",
                                   "uint32_t  maxTexelOffset",
                                   "int32_t  minTexelGatherOffset",
                                   "uint32_t  maxTexelGatherOffset",
                                   "float  minInterpolationOffset",
                                   "float  maxInterpolationOffset",
                                   "uint32_t  subPixelInterpolationOffsetBits",
                                   "uint32_t  maxFramebufferWidth",
                                   "uint32_t  maxFramebufferHeight",
                                   "uint32_t  maxFramebufferLayers",
                                   "VkSampleCountFlags  framebufferColorSampleCounts",
                                   "VkSampleCountFlags  framebufferDepthSampleCounts",
                                   "VkSampleCountFlags  framebufferStencilSampleCounts",
                                   "VkSampleCountFlags  framebufferNoAttachmentsSampleCounts",
                                   "uint32_t  maxColorAttachments",
                                   "VkSampleCountFlags  sampledImageColorSampleCounts",
                                   "VkSampleCountFlags  sampledImageIntegerSampleCounts",
                                   "VkSampleCountFlags  sampledImageDepthSampleCounts",
                                   "VkSampleCountFlags  sampledImageStencilSampleCounts",
                                   "VkSampleCountFlags  storageImageSampleCounts",
                                   "uint32_t  maxSampleMaskWords",
                                   "VkBool32  timestampComputeAndGraphics",
                                   "float  timestampPeriod",
                                   "uint32_t  maxClipDistances",
                                   "uint32_t  maxCullDistances",
                                   "uint32_t  maxCombinedClipAndCullDistances",
                                   "uint32_t  discreteQueuePriorities",
                                   "float  pointSizeRange [2]",
                                   "float  lineWidthRange [2]",
                                   "float  pointSizeGranularity",
                                   "float  lineWidthGranularity",
                                   "VkBool32  strictLines",
                                   "VkBool32  standardSampleLocations",
                                   "VkDeviceSize  optimalBufferCopyOffsetAlignment",
                                   "VkDeviceSize  optimalBufferCopyRowPitchAlignment",
                                   "VkDeviceSize  nonCoherentAtomSize"]

  VkPhysicalDeviceLineRasterizationFeaturesEXT = struct ["VkStructureType  sType",
                                                         "void * pNext",
                                                         "VkBool32  rectangularLines",
                                                         "VkBool32  bresenhamLines",
                                                         "VkBool32  smoothLines",
                                                         "VkBool32  stippledRectangularLines",
                                                         "VkBool32  stippledBresenhamLines",
                                                         "VkBool32  stippledSmoothLines"]

  VkPhysicalDeviceLineRasterizationPropertiesEXT = struct ["VkStructureType  sType",
                                                           "void * pNext",
                                                           "uint32_t  lineSubPixelPrecisionBits"]

  VkPhysicalDeviceLinearColorAttachmentFeaturesNV = struct ["VkStructureType  sType",
                                                            "void * pNext",
                                                            "VkBool32  linearColorAttachment"]

  VkPhysicalDeviceMaintenance3Properties = struct ["VkStructureType  sType",
                                                   "void * pNext",
                                                   "uint32_t  maxPerSetDescriptors",
                                                   "VkDeviceSize  maxMemoryAllocationSize"]

  VkPhysicalDeviceMaintenance3PropertiesKHR = VkPhysicalDeviceMaintenance3Properties

  VkPhysicalDeviceMaintenance4Features = struct ["VkStructureType  sType",
                                                 "void * pNext",
                                                 "VkBool32  maintenance4"]

  VkPhysicalDeviceMaintenance4FeaturesKHR = VkPhysicalDeviceMaintenance4Features

  VkPhysicalDeviceMaintenance4Properties = struct ["VkStructureType  sType",
                                                   "void * pNext",
                                                   "VkDeviceSize  maxBufferSize"]

  VkPhysicalDeviceMaintenance4PropertiesKHR = VkPhysicalDeviceMaintenance4Properties

  VkPhysicalDeviceMemoryBudgetPropertiesEXT = struct ["VkStructureType  sType",
                                                      "void * pNext",
                                                      "VkDeviceSize  heapBudget[#{VK_MAX_MEMORY_HEAPS}]",
                                                      "VkDeviceSize  heapUsage[#{VK_MAX_MEMORY_HEAPS}]"]

  VkPhysicalDeviceMemoryPriorityFeaturesEXT = struct ["VkStructureType  sType",
                                                      "void * pNext",
                                                      "VkBool32  memoryPriority"]

  VkPhysicalDeviceMemoryProperties = struct ["uint32_t  memoryTypeCount",
                                             { "memoryTypes[#{VK_MAX_MEMORY_TYPES}]" => VkMemoryType },
                                             "uint32_t  memoryHeapCount",
                                             { "memoryHeaps[#{VK_MAX_MEMORY_HEAPS}]" => VkMemoryHeap }]

  VkPhysicalDeviceMemoryProperties2 = struct ["VkStructureType  sType",
                                              "void * pNext",
                                              { "memoryProperties" => VkPhysicalDeviceMemoryProperties }]

  VkPhysicalDeviceMemoryProperties2KHR = VkPhysicalDeviceMemoryProperties2

  VkPhysicalDeviceMeshShaderFeaturesNV = struct ["VkStructureType  sType",
                                                 "void * pNext",
                                                 "VkBool32  taskShader",
                                                 "VkBool32  meshShader"]

  VkPhysicalDeviceMeshShaderPropertiesNV = struct ["VkStructureType  sType",
                                                   "void * pNext",
                                                   "uint32_t  maxDrawMeshTasksCount",
                                                   "uint32_t  maxTaskWorkGroupInvocations",
                                                   "uint32_t  maxTaskWorkGroupSize [3]",
                                                   "uint32_t  maxTaskTotalMemorySize",
                                                   "uint32_t  maxTaskOutputCount",
                                                   "uint32_t  maxMeshWorkGroupInvocations",
                                                   "uint32_t  maxMeshWorkGroupSize [3]",
                                                   "uint32_t  maxMeshTotalMemorySize",
                                                   "uint32_t  maxMeshOutputVertices",
                                                   "uint32_t  maxMeshOutputPrimitives",
                                                   "uint32_t  maxMeshMultiviewViewCount",
                                                   "uint32_t  meshOutputPerVertexGranularity",
                                                   "uint32_t  meshOutputPerPrimitiveGranularity"]

  VkPhysicalDeviceMultiDrawFeaturesEXT = struct ["VkStructureType  sType",
                                                 "void * pNext",
                                                 "VkBool32  multiDraw"]

  VkPhysicalDeviceMultiDrawPropertiesEXT = struct ["VkStructureType  sType",
                                                   "void * pNext",
                                                   "uint32_t  maxMultiDrawCount"]

  VkPhysicalDeviceMultiviewFeatures = struct ["VkStructureType  sType",
                                              "void * pNext",
                                              "VkBool32  multiview",
                                              "VkBool32  multiviewGeometryShader",
                                              "VkBool32  multiviewTessellationShader"]

  VkPhysicalDeviceMultiviewFeaturesKHR = VkPhysicalDeviceMultiviewFeatures

  VkPhysicalDeviceMultiviewPerViewAttributesPropertiesNVX = struct ["VkStructureType  sType",
                                                                    "void * pNext",
                                                                    "VkBool32  perViewPositionAllComponents"]

  VkPhysicalDeviceMultiviewProperties = struct ["VkStructureType  sType",
                                                "void * pNext",
                                                "uint32_t  maxMultiviewViewCount",
                                                "uint32_t  maxMultiviewInstanceIndex"]

  VkPhysicalDeviceMultiviewPropertiesKHR = VkPhysicalDeviceMultiviewProperties

  VkPhysicalDeviceMutableDescriptorTypeFeaturesVALVE = struct ["VkStructureType  sType",
                                                               "void * pNext",
                                                               "VkBool32  mutableDescriptorType"]

  VkPhysicalDevicePCIBusInfoPropertiesEXT = struct ["VkStructureType  sType",
                                                    "void * pNext",
                                                    "uint32_t  pciDomain",
                                                    "uint32_t  pciBus",
                                                    "uint32_t  pciDevice",
                                                    "uint32_t  pciFunction"]

  VkPhysicalDevicePageableDeviceLocalMemoryFeaturesEXT = struct ["VkStructureType  sType",
                                                                 "void * pNext",
                                                                 "VkBool32  pageableDeviceLocalMemory"]

  VkPhysicalDevicePerformanceQueryFeaturesKHR = struct ["VkStructureType  sType",
                                                        "void * pNext",
                                                        "VkBool32  performanceCounterQueryPools",
                                                        "VkBool32  performanceCounterMultipleQueryPools"]

  VkPhysicalDevicePerformanceQueryPropertiesKHR = struct ["VkStructureType  sType",
                                                          "void * pNext",
                                                          "VkBool32  allowCommandBufferQueryCopies"]

  VkPhysicalDevicePipelineCreationCacheControlFeatures = struct ["VkStructureType  sType",
                                                                 "void * pNext",
                                                                 "VkBool32  pipelineCreationCacheControl"]

  VkPhysicalDevicePipelineCreationCacheControlFeaturesEXT = VkPhysicalDevicePipelineCreationCacheControlFeatures

  VkPhysicalDevicePipelineExecutablePropertiesFeaturesKHR = struct ["VkStructureType  sType",
                                                                    "void * pNext",
                                                                    "VkBool32  pipelineExecutableInfo"]

  VkPhysicalDevicePointClippingProperties = struct ["VkStructureType  sType",
                                                    "void * pNext",
                                                    "VkPointClippingBehavior  pointClippingBehavior"]

  VkPhysicalDevicePointClippingPropertiesKHR = VkPhysicalDevicePointClippingProperties

  VkPhysicalDevicePortabilitySubsetFeaturesKHR = struct ["VkStructureType  sType",
                                                         "void * pNext",
                                                         "VkBool32  constantAlphaColorBlendFactors",
                                                         "VkBool32  events",
                                                         "VkBool32  imageViewFormatReinterpretation",
                                                         "VkBool32  imageViewFormatSwizzle",
                                                         "VkBool32  imageView2DOn3DImage",
                                                         "VkBool32  multisampleArrayImage",
                                                         "VkBool32  mutableComparisonSamplers",
                                                         "VkBool32  pointPolygons",
                                                         "VkBool32  samplerMipLodBias",
                                                         "VkBool32  separateStencilMaskRef",
                                                         "VkBool32  shaderSampleRateInterpolationFunctions",
                                                         "VkBool32  tessellationIsolines",
                                                         "VkBool32  tessellationPointMode",
                                                         "VkBool32  triangleFans",
                                                         "VkBool32  vertexAttributeAccessBeyondStride"]

  VkPhysicalDevicePortabilitySubsetPropertiesKHR = struct ["VkStructureType  sType",
                                                           "void * pNext",
                                                           "uint32_t  minVertexInputBindingStrideAlignment"]

  VkPhysicalDevicePresentIdFeaturesKHR = struct ["VkStructureType  sType",
                                                 "void * pNext",
                                                 "VkBool32  presentId"]

  VkPhysicalDevicePresentWaitFeaturesKHR = struct ["VkStructureType  sType",
                                                   "void * pNext",
                                                   "VkBool32  presentWait"]

  VkPhysicalDevicePresentationPropertiesANDROID = struct ["VkStructureType  sType",
                                                          "void * pNext",
                                                          "VkBool32  sharedImage"]

  VkPhysicalDevicePrimitiveTopologyListRestartFeaturesEXT = struct ["VkStructureType  sType",
                                                                    "void * pNext",
                                                                    "VkBool32  primitiveTopologyListRestart",
                                                                    "VkBool32  primitiveTopologyPatchListRestart"]

  VkPhysicalDevicePrivateDataFeatures = struct ["VkStructureType  sType",
                                                "void * pNext",
                                                "VkBool32  privateData"]

  VkPhysicalDevicePrivateDataFeaturesEXT = VkPhysicalDevicePrivateDataFeatures

  VkPhysicalDeviceSparseProperties = struct ["VkBool32  residencyStandard2DBlockShape",
                                             "VkBool32  residencyStandard2DMultisampleBlockShape",
                                             "VkBool32  residencyStandard3DBlockShape",
                                             "VkBool32  residencyAlignedMipSize",
                                             "VkBool32  residencyNonResidentStrict"]
  VkPhysicalDeviceProperties = struct ["uint32_t  apiVersion",
                                       "uint32_t  driverVersion",
                                       "uint32_t  vendorID",
                                       "uint32_t  deviceID",
                                       "VkPhysicalDeviceType  deviceType",
                                       "char  deviceName[#{VK_MAX_PHYSICAL_DEVICE_NAME_SIZE}]",
                                       "uint8_t  pipelineCacheUUID[#{VK_UUID_SIZE}]",
                                       { "limits" => VkPhysicalDeviceLimits },
                                       { "sparseProperties" => VkPhysicalDeviceSparseProperties }]

  VkPhysicalDeviceProperties2 = struct ["VkStructureType  sType",
                                        "void * pNext",
                                        { "properties" => VkPhysicalDeviceProperties }]

  VkPhysicalDeviceProperties2KHR = VkPhysicalDeviceProperties2

  VkPhysicalDeviceProtectedMemoryFeatures = struct ["VkStructureType  sType",
                                                    "void * pNext",
                                                    "VkBool32  protectedMemory"]

  VkPhysicalDeviceProtectedMemoryProperties = struct ["VkStructureType  sType",
                                                      "void * pNext",
                                                      "VkBool32  protectedNoFault"]

  VkPhysicalDeviceProvokingVertexFeaturesEXT = struct ["VkStructureType  sType",
                                                       "void * pNext",
                                                       "VkBool32  provokingVertexLast",
                                                       "VkBool32  transformFeedbackPreservesProvokingVertex"]

  VkPhysicalDeviceProvokingVertexPropertiesEXT = struct ["VkStructureType  sType",
                                                         "void * pNext",
                                                         "VkBool32  provokingVertexModePerPipeline",
                                                         "VkBool32  transformFeedbackPreservesTriangleFanProvokingVertex"]

  VkPhysicalDevicePushDescriptorPropertiesKHR = struct ["VkStructureType  sType",
                                                        "void * pNext",
                                                        "uint32_t  maxPushDescriptors"]

  VkPhysicalDeviceRGBA10X6FormatsFeaturesEXT = struct ["VkStructureType  sType",
                                                       "void * pNext",
                                                       "VkBool32  formatRgba10x6WithoutYCbCrSampler"]

  VkPhysicalDeviceRasterizationOrderAttachmentAccessFeaturesARM = struct ["VkStructureType  sType",
                                                                          "void * pNext",
                                                                          "VkBool32  rasterizationOrderColorAttachmentAccess",
                                                                          "VkBool32  rasterizationOrderDepthAttachmentAccess",
                                                                          "VkBool32  rasterizationOrderStencilAttachmentAccess"]

  VkPhysicalDeviceRayQueryFeaturesKHR = struct ["VkStructureType  sType",
                                                "void * pNext",
                                                "VkBool32  rayQuery"]

  VkPhysicalDeviceRayTracingMotionBlurFeaturesNV = struct ["VkStructureType  sType",
                                                           "void * pNext",
                                                           "VkBool32  rayTracingMotionBlur",
                                                           "VkBool32  rayTracingMotionBlurPipelineTraceRaysIndirect"]

  VkPhysicalDeviceRayTracingPipelineFeaturesKHR = struct ["VkStructureType  sType",
                                                          "void * pNext",
                                                          "VkBool32  rayTracingPipeline",
                                                          "VkBool32  rayTracingPipelineShaderGroupHandleCaptureReplay",
                                                          "VkBool32  rayTracingPipelineShaderGroupHandleCaptureReplayMixed",
                                                          "VkBool32  rayTracingPipelineTraceRaysIndirect",
                                                          "VkBool32  rayTraversalPrimitiveCulling"]

  VkPhysicalDeviceRayTracingPipelinePropertiesKHR = struct ["VkStructureType  sType",
                                                            "void * pNext",
                                                            "uint32_t  shaderGroupHandleSize",
                                                            "uint32_t  maxRayRecursionDepth",
                                                            "uint32_t  maxShaderGroupStride",
                                                            "uint32_t  shaderGroupBaseAlignment",
                                                            "uint32_t  shaderGroupHandleCaptureReplaySize",
                                                            "uint32_t  maxRayDispatchInvocationCount",
                                                            "uint32_t  shaderGroupHandleAlignment",
                                                            "uint32_t  maxRayHitAttributeSize"]

  VkPhysicalDeviceRayTracingPropertiesNV = struct ["VkStructureType  sType",
                                                   "void * pNext",
                                                   "uint32_t  shaderGroupHandleSize",
                                                   "uint32_t  maxRecursionDepth",
                                                   "uint32_t  maxShaderGroupStride",
                                                   "uint32_t  shaderGroupBaseAlignment",
                                                   "uint64_t  maxGeometryCount",
                                                   "uint64_t  maxInstanceCount",
                                                   "uint64_t  maxTriangleCount",
                                                   "uint32_t  maxDescriptorSetAccelerationStructures"]

  VkPhysicalDeviceRepresentativeFragmentTestFeaturesNV = struct ["VkStructureType  sType",
                                                                 "void * pNext",
                                                                 "VkBool32  representativeFragmentTest"]

  VkPhysicalDeviceRobustness2FeaturesEXT = struct ["VkStructureType  sType",
                                                   "void * pNext",
                                                   "VkBool32  robustBufferAccess2",
                                                   "VkBool32  robustImageAccess2",
                                                   "VkBool32  nullDescriptor"]

  VkPhysicalDeviceRobustness2PropertiesEXT = struct ["VkStructureType  sType",
                                                     "void * pNext",
                                                     "VkDeviceSize  robustStorageBufferAccessSizeAlignment",
                                                     "VkDeviceSize  robustUniformBufferAccessSizeAlignment"]

  VkPhysicalDeviceSampleLocationsPropertiesEXT = struct ["VkStructureType  sType",
                                                         "void * pNext",
                                                         "VkSampleCountFlags  sampleLocationSampleCounts",
                                                         { "maxSampleLocationGridSize" => VkExtent2D },
                                                         "float  sampleLocationCoordinateRange [2]",
                                                         "uint32_t  sampleLocationSubPixelBits",
                                                         "VkBool32  variableSampleLocations"]

  VkPhysicalDeviceSamplerFilterMinmaxProperties = struct ["VkStructureType  sType",
                                                          "void * pNext",
                                                          "VkBool32  filterMinmaxSingleComponentFormats",
                                                          "VkBool32  filterMinmaxImageComponentMapping"]

  VkPhysicalDeviceSamplerFilterMinmaxPropertiesEXT = VkPhysicalDeviceSamplerFilterMinmaxProperties

  VkPhysicalDeviceSamplerYcbcrConversionFeatures = struct ["VkStructureType  sType",
                                                           "void * pNext",
                                                           "VkBool32  samplerYcbcrConversion"]

  VkPhysicalDeviceSamplerYcbcrConversionFeaturesKHR = VkPhysicalDeviceSamplerYcbcrConversionFeatures

  VkPhysicalDeviceScalarBlockLayoutFeatures = struct ["VkStructureType  sType",
                                                      "void * pNext",
                                                      "VkBool32  scalarBlockLayout"]

  VkPhysicalDeviceScalarBlockLayoutFeaturesEXT = VkPhysicalDeviceScalarBlockLayoutFeatures

  VkPhysicalDeviceSeparateDepthStencilLayoutsFeatures = struct ["VkStructureType  sType",
                                                                "void * pNext",
                                                                "VkBool32  separateDepthStencilLayouts"]

  VkPhysicalDeviceSeparateDepthStencilLayoutsFeaturesKHR = VkPhysicalDeviceSeparateDepthStencilLayoutsFeatures

  VkPhysicalDeviceShaderAtomicFloat2FeaturesEXT = struct ["VkStructureType  sType",
                                                          "void * pNext",
                                                          "VkBool32  shaderBufferFloat16Atomics",
                                                          "VkBool32  shaderBufferFloat16AtomicAdd",
                                                          "VkBool32  shaderBufferFloat16AtomicMinMax",
                                                          "VkBool32  shaderBufferFloat32AtomicMinMax",
                                                          "VkBool32  shaderBufferFloat64AtomicMinMax",
                                                          "VkBool32  shaderSharedFloat16Atomics",
                                                          "VkBool32  shaderSharedFloat16AtomicAdd",
                                                          "VkBool32  shaderSharedFloat16AtomicMinMax",
                                                          "VkBool32  shaderSharedFloat32AtomicMinMax",
                                                          "VkBool32  shaderSharedFloat64AtomicMinMax",
                                                          "VkBool32  shaderImageFloat32AtomicMinMax",
                                                          "VkBool32  sparseImageFloat32AtomicMinMax"]

  VkPhysicalDeviceShaderAtomicFloatFeaturesEXT = struct ["VkStructureType  sType",
                                                         "void * pNext",
                                                         "VkBool32  shaderBufferFloat32Atomics",
                                                         "VkBool32  shaderBufferFloat32AtomicAdd",
                                                         "VkBool32  shaderBufferFloat64Atomics",
                                                         "VkBool32  shaderBufferFloat64AtomicAdd",
                                                         "VkBool32  shaderSharedFloat32Atomics",
                                                         "VkBool32  shaderSharedFloat32AtomicAdd",
                                                         "VkBool32  shaderSharedFloat64Atomics",
                                                         "VkBool32  shaderSharedFloat64AtomicAdd",
                                                         "VkBool32  shaderImageFloat32Atomics",
                                                         "VkBool32  shaderImageFloat32AtomicAdd",
                                                         "VkBool32  sparseImageFloat32Atomics",
                                                         "VkBool32  sparseImageFloat32AtomicAdd"]

  VkPhysicalDeviceShaderAtomicInt64Features = struct ["VkStructureType  sType",
                                                      "void * pNext",
                                                      "VkBool32  shaderBufferInt64Atomics",
                                                      "VkBool32  shaderSharedInt64Atomics"]

  VkPhysicalDeviceShaderAtomicInt64FeaturesKHR = VkPhysicalDeviceShaderAtomicInt64Features

  VkPhysicalDeviceShaderClockFeaturesKHR = struct ["VkStructureType  sType",
                                                   "void * pNext",
                                                   "VkBool32  shaderSubgroupClock",
                                                   "VkBool32  shaderDeviceClock"]

  VkPhysicalDeviceShaderCoreProperties2AMD = struct ["VkStructureType  sType",
                                                     "void * pNext",
                                                     "VkShaderCorePropertiesFlagsAMD  shaderCoreFeatures",
                                                     "uint32_t  activeComputeUnitCount"]

  VkPhysicalDeviceShaderCorePropertiesAMD = struct ["VkStructureType  sType",
                                                    "void * pNext",
                                                    "uint32_t  shaderEngineCount",
                                                    "uint32_t  shaderArraysPerEngineCount",
                                                    "uint32_t  computeUnitsPerShaderArray",
                                                    "uint32_t  simdPerComputeUnit",
                                                    "uint32_t  wavefrontsPerSimd",
                                                    "uint32_t  wavefrontSize",
                                                    "uint32_t  sgprsPerSimd",
                                                    "uint32_t  minSgprAllocation",
                                                    "uint32_t  maxSgprAllocation",
                                                    "uint32_t  sgprAllocationGranularity",
                                                    "uint32_t  vgprsPerSimd",
                                                    "uint32_t  minVgprAllocation",
                                                    "uint32_t  maxVgprAllocation",
                                                    "uint32_t  vgprAllocationGranularity"]

  VkPhysicalDeviceShaderDemoteToHelperInvocationFeatures = struct ["VkStructureType  sType",
                                                                   "void * pNext",
                                                                   "VkBool32  shaderDemoteToHelperInvocation"]

  VkPhysicalDeviceShaderDemoteToHelperInvocationFeaturesEXT = VkPhysicalDeviceShaderDemoteToHelperInvocationFeatures

  VkPhysicalDeviceShaderDrawParametersFeatures = struct ["VkStructureType  sType",
                                                         "void * pNext",
                                                         "VkBool32  shaderDrawParameters"]
  VkPhysicalDeviceShaderDrawParameterFeatures = VkPhysicalDeviceShaderDrawParametersFeatures

  VkPhysicalDeviceShaderFloat16Int8FeaturesKHR = VkPhysicalDeviceShaderFloat16Int8Features

  VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT = struct ["VkStructureType  sType",
                                                              "void * pNext",
                                                              "VkBool32  shaderImageInt64Atomics",
                                                              "VkBool32  sparseImageInt64Atomics"]

  VkPhysicalDeviceShaderImageFootprintFeaturesNV = struct ["VkStructureType  sType",
                                                           "void * pNext",
                                                           "VkBool32  imageFootprint"]

  VkPhysicalDeviceShaderIntegerDotProductFeatures = struct ["VkStructureType  sType",
                                                            "void * pNext",
                                                            "VkBool32  shaderIntegerDotProduct"]

  VkPhysicalDeviceShaderIntegerDotProductFeaturesKHR = VkPhysicalDeviceShaderIntegerDotProductFeatures

  VkPhysicalDeviceShaderIntegerDotProductProperties = struct ["VkStructureType  sType",
                                                              "void * pNext",
                                                              "VkBool32  integerDotProduct8BitUnsignedAccelerated",
                                                              "VkBool32  integerDotProduct8BitSignedAccelerated",
                                                              "VkBool32  integerDotProduct8BitMixedSignednessAccelerated",
                                                              "VkBool32  integerDotProduct4x8BitPackedUnsignedAccelerated",
                                                              "VkBool32  integerDotProduct4x8BitPackedSignedAccelerated",
                                                              "VkBool32  integerDotProduct4x8BitPackedMixedSignednessAccelerated",
                                                              "VkBool32  integerDotProduct16BitUnsignedAccelerated",
                                                              "VkBool32  integerDotProduct16BitSignedAccelerated",
                                                              "VkBool32  integerDotProduct16BitMixedSignednessAccelerated",
                                                              "VkBool32  integerDotProduct32BitUnsignedAccelerated",
                                                              "VkBool32  integerDotProduct32BitSignedAccelerated",
                                                              "VkBool32  integerDotProduct32BitMixedSignednessAccelerated",
                                                              "VkBool32  integerDotProduct64BitUnsignedAccelerated",
                                                              "VkBool32  integerDotProduct64BitSignedAccelerated",
                                                              "VkBool32  integerDotProduct64BitMixedSignednessAccelerated",
                                                              "VkBool32  integerDotProductAccumulatingSaturating8BitUnsignedAccelerated",
                                                              "VkBool32  integerDotProductAccumulatingSaturating8BitSignedAccelerated",
                                                              "VkBool32  integerDotProductAccumulatingSaturating8BitMixedSignednessAccelerated",
                                                              "VkBool32  integerDotProductAccumulatingSaturating4x8BitPackedUnsignedAccelerated",
                                                              "VkBool32  integerDotProductAccumulatingSaturating4x8BitPackedSignedAccelerated",
                                                              "VkBool32  integerDotProductAccumulatingSaturating4x8BitPackedMixedSignednessAccelerated",
                                                              "VkBool32  integerDotProductAccumulatingSaturating16BitUnsignedAccelerated",
                                                              "VkBool32  integerDotProductAccumulatingSaturating16BitSignedAccelerated",
                                                              "VkBool32  integerDotProductAccumulatingSaturating16BitMixedSignednessAccelerated",
                                                              "VkBool32  integerDotProductAccumulatingSaturating32BitUnsignedAccelerated",
                                                              "VkBool32  integerDotProductAccumulatingSaturating32BitSignedAccelerated",
                                                              "VkBool32  integerDotProductAccumulatingSaturating32BitMixedSignednessAccelerated",
                                                              "VkBool32  integerDotProductAccumulatingSaturating64BitUnsignedAccelerated",
                                                              "VkBool32  integerDotProductAccumulatingSaturating64BitSignedAccelerated",
                                                              "VkBool32  integerDotProductAccumulatingSaturating64BitMixedSignednessAccelerated"]

  VkPhysicalDeviceShaderIntegerDotProductPropertiesKHR = VkPhysicalDeviceShaderIntegerDotProductProperties

  VkPhysicalDeviceShaderIntegerFunctions2FeaturesINTEL = struct ["VkStructureType  sType",
                                                                 "void * pNext",
                                                                 "VkBool32  shaderIntegerFunctions2"]

  VkPhysicalDeviceShaderSMBuiltinsFeaturesNV = struct ["VkStructureType  sType",
                                                       "void * pNext",
                                                       "VkBool32  shaderSMBuiltins"]

  VkPhysicalDeviceShaderSMBuiltinsPropertiesNV = struct ["VkStructureType  sType",
                                                         "void * pNext",
                                                         "uint32_t  shaderSMCount",
                                                         "uint32_t  shaderWarpsPerSM"]

  VkPhysicalDeviceShaderSubgroupExtendedTypesFeatures = struct ["VkStructureType  sType",
                                                                "void * pNext",
                                                                "VkBool32  shaderSubgroupExtendedTypes"]

  VkPhysicalDeviceShaderSubgroupExtendedTypesFeaturesKHR = VkPhysicalDeviceShaderSubgroupExtendedTypesFeatures

  VkPhysicalDeviceShaderSubgroupUniformControlFlowFeaturesKHR = struct ["VkStructureType  sType",
                                                                        "void * pNext",
                                                                        "VkBool32  shaderSubgroupUniformControlFlow"]

  VkPhysicalDeviceShaderTerminateInvocationFeatures = struct ["VkStructureType  sType",
                                                              "void * pNext",
                                                              "VkBool32  shaderTerminateInvocation"]

  VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR = VkPhysicalDeviceShaderTerminateInvocationFeatures

  VkPhysicalDeviceShadingRateImageFeaturesNV = struct ["VkStructureType  sType",
                                                       "void * pNext",
                                                       "VkBool32  shadingRateImage",
                                                       "VkBool32  shadingRateCoarseSampleOrder"]

  VkPhysicalDeviceShadingRateImagePropertiesNV = struct ["VkStructureType  sType",
                                                         "void * pNext",
                                                         { "shadingRateTexelSize" => VkExtent2D },
                                                         "uint32_t  shadingRatePaletteSize",
                                                         "uint32_t  shadingRateMaxCoarseSamples"]

  VkPhysicalDeviceSparseImageFormatInfo2 = struct ["VkStructureType  sType",
                                                   "void * pNext",
                                                   "VkFormat  format",
                                                   "VkImageType  type",
                                                   "VkSampleCountFlagBits  samples",
                                                   "VkImageUsageFlags  usage",
                                                   "VkImageTiling  tiling"]

  VkPhysicalDeviceSparseImageFormatInfo2KHR = VkPhysicalDeviceSparseImageFormatInfo2

  VkPhysicalDeviceSubgroupProperties = struct ["VkStructureType  sType",
                                               "void * pNext",
                                               "uint32_t  subgroupSize",
                                               "VkShaderStageFlags  supportedStages",
                                               "VkSubgroupFeatureFlags  supportedOperations",
                                               "VkBool32  quadOperationsInAllStages"]

  VkPhysicalDeviceSubgroupSizeControlFeatures = struct ["VkStructureType  sType",
                                                        "void * pNext",
                                                        "VkBool32  subgroupSizeControl",
                                                        "VkBool32  computeFullSubgroups"]

  VkPhysicalDeviceSubgroupSizeControlFeaturesEXT = VkPhysicalDeviceSubgroupSizeControlFeatures

  VkPhysicalDeviceSubgroupSizeControlProperties = struct ["VkStructureType  sType",
                                                          "void * pNext",
                                                          "uint32_t  minSubgroupSize",
                                                          "uint32_t  maxSubgroupSize",
                                                          "uint32_t  maxComputeWorkgroupSubgroups",
                                                          "VkShaderStageFlags  requiredSubgroupSizeStages"]

  VkPhysicalDeviceSubgroupSizeControlPropertiesEXT = VkPhysicalDeviceSubgroupSizeControlProperties

  VkPhysicalDeviceSubpassShadingFeaturesHUAWEI = struct ["VkStructureType  sType",
                                                         "void * pNext",
                                                         "VkBool32  subpassShading"]

  VkPhysicalDeviceSubpassShadingPropertiesHUAWEI = struct ["VkStructureType  sType",
                                                           "void * pNext",
                                                           "uint32_t  maxSubpassShadingWorkgroupSizeAspectRatio"]

  VkPhysicalDeviceSurfaceInfo2KHR = struct ["VkStructureType  sType",
                                            "void * pNext",
                                            "VkSurfaceKHR  surface"]

  VkPhysicalDeviceSynchronization2Features = struct ["VkStructureType  sType",
                                                     "void * pNext",
                                                     "VkBool32  synchronization2"]

  VkPhysicalDeviceSynchronization2FeaturesKHR = VkPhysicalDeviceSynchronization2Features

  VkPhysicalDeviceTexelBufferAlignmentFeaturesEXT = struct ["VkStructureType  sType",
                                                            "void * pNext",
                                                            "VkBool32  texelBufferAlignment"]

  VkPhysicalDeviceTexelBufferAlignmentProperties = struct ["VkStructureType  sType",
                                                           "void * pNext",
                                                           "VkDeviceSize  storageTexelBufferOffsetAlignmentBytes",
                                                           "VkBool32  storageTexelBufferOffsetSingleTexelAlignment",
                                                           "VkDeviceSize  uniformTexelBufferOffsetAlignmentBytes",
                                                           "VkBool32  uniformTexelBufferOffsetSingleTexelAlignment"]

  VkPhysicalDeviceTexelBufferAlignmentPropertiesEXT = VkPhysicalDeviceTexelBufferAlignmentProperties

  VkPhysicalDeviceTextureCompressionASTCHDRFeatures = struct ["VkStructureType  sType",
                                                              "void * pNext",
                                                              "VkBool32  textureCompressionASTC_HDR"]

  VkPhysicalDeviceTextureCompressionASTCHDRFeaturesEXT = VkPhysicalDeviceTextureCompressionASTCHDRFeatures

  VkPhysicalDeviceTimelineSemaphoreFeatures = struct ["VkStructureType  sType",
                                                      "void * pNext",
                                                      "VkBool32  timelineSemaphore"]

  VkPhysicalDeviceTimelineSemaphoreFeaturesKHR = VkPhysicalDeviceTimelineSemaphoreFeatures

  VkPhysicalDeviceTimelineSemaphoreProperties = struct ["VkStructureType  sType",
                                                        "void * pNext",
                                                        "uint64_t  maxTimelineSemaphoreValueDifference"]

  VkPhysicalDeviceTimelineSemaphorePropertiesKHR = VkPhysicalDeviceTimelineSemaphoreProperties

  VkPhysicalDeviceToolProperties = struct ["VkStructureType  sType",
                                           "void * pNext",
                                           "char  name[#{VK_MAX_EXTENSION_NAME_SIZE}]",
                                           "char  version[#{VK_MAX_EXTENSION_NAME_SIZE}]",
                                           "VkToolPurposeFlags  purposes",
                                           "char  description[#{VK_MAX_DESCRIPTION_SIZE}]",
                                           "char  layer[#{VK_MAX_EXTENSION_NAME_SIZE}]"]

  VkPhysicalDeviceToolPropertiesEXT = VkPhysicalDeviceToolProperties

  VkPhysicalDeviceTransformFeedbackFeaturesEXT = struct ["VkStructureType  sType",
                                                         "void * pNext",
                                                         "VkBool32  transformFeedback",
                                                         "VkBool32  geometryStreams"]

  VkPhysicalDeviceTransformFeedbackPropertiesEXT = struct ["VkStructureType  sType",
                                                           "void * pNext",
                                                           "uint32_t  maxTransformFeedbackStreams",
                                                           "uint32_t  maxTransformFeedbackBuffers",
                                                           "VkDeviceSize  maxTransformFeedbackBufferSize",
                                                           "uint32_t  maxTransformFeedbackStreamDataSize",
                                                           "uint32_t  maxTransformFeedbackBufferDataSize",
                                                           "uint32_t  maxTransformFeedbackBufferDataStride",
                                                           "VkBool32  transformFeedbackQueries",
                                                           "VkBool32  transformFeedbackStreamsLinesTriangles",
                                                           "VkBool32  transformFeedbackRasterizationStreamSelect",
                                                           "VkBool32  transformFeedbackDraw"]

  VkPhysicalDeviceUniformBufferStandardLayoutFeatures = struct ["VkStructureType  sType",
                                                                "void * pNext",
                                                                "VkBool32  uniformBufferStandardLayout"]

  VkPhysicalDeviceUniformBufferStandardLayoutFeaturesKHR = VkPhysicalDeviceUniformBufferStandardLayoutFeatures

  VkPhysicalDeviceVariablePointersFeatures = struct ["VkStructureType  sType",
                                                     "void * pNext",
                                                     "VkBool32  variablePointersStorageBuffer",
                                                     "VkBool32  variablePointers"]
  VkPhysicalDeviceVariablePointerFeatures = VkPhysicalDeviceVariablePointersFeatures

  VkPhysicalDeviceVariablePointerFeaturesKHR = VkPhysicalDeviceVariablePointersFeatures

  VkPhysicalDeviceVariablePointersFeaturesKHR = VkPhysicalDeviceVariablePointersFeatures

  VkPhysicalDeviceVertexAttributeDivisorFeaturesEXT = struct ["VkStructureType  sType",
                                                              "void * pNext",
                                                              "VkBool32  vertexAttributeInstanceRateDivisor",
                                                              "VkBool32  vertexAttributeInstanceRateZeroDivisor"]

  VkPhysicalDeviceVertexAttributeDivisorPropertiesEXT = struct ["VkStructureType  sType",
                                                                "void * pNext",
                                                                "uint32_t  maxVertexAttribDivisor"]

  VkPhysicalDeviceVertexInputDynamicStateFeaturesEXT = struct ["VkStructureType  sType",
                                                               "void * pNext",
                                                               "VkBool32  vertexInputDynamicState"]

  VkVideoProfileKHR = struct ["VkStructureType  sType",
                              "void * pNext",
                              "VkVideoCodecOperationFlagBitsKHR  videoCodecOperation",
                              "VkVideoChromaSubsamplingFlagsKHR  chromaSubsampling",
                              "VkVideoComponentBitDepthFlagsKHR  lumaBitDepth",
                              "VkVideoComponentBitDepthFlagsKHR  chromaBitDepth"]
  VkVideoProfilesKHR = struct ["VkStructureType  sType",
                               "void * pNext",
                               "uint32_t  profileCount",
                               "VkVideoProfileKHR * pProfiles"]
  VkPhysicalDeviceVideoFormatInfoKHR = struct ["VkStructureType  sType",
                                               "void * pNext",
                                               "VkImageUsageFlags  imageUsage",
                                               "VkVideoProfilesKHR * pVideoProfiles"]

  VkPhysicalDeviceVulkan11Features = struct ["VkStructureType  sType",
                                             "void * pNext",
                                             "VkBool32  storageBuffer16BitAccess",
                                             "VkBool32  uniformAndStorageBuffer16BitAccess",
                                             "VkBool32  storagePushConstant16",
                                             "VkBool32  storageInputOutput16",
                                             "VkBool32  multiview",
                                             "VkBool32  multiviewGeometryShader",
                                             "VkBool32  multiviewTessellationShader",
                                             "VkBool32  variablePointersStorageBuffer",
                                             "VkBool32  variablePointers",
                                             "VkBool32  protectedMemory",
                                             "VkBool32  samplerYcbcrConversion",
                                             "VkBool32  shaderDrawParameters"]

  VkPhysicalDeviceVulkan11Properties = struct ["VkStructureType  sType",
                                               "void * pNext",
                                               "uint8_t  deviceUUID[#{VK_UUID_SIZE}]",
                                               "uint8_t  driverUUID[#{VK_UUID_SIZE}]",
                                               "uint8_t  deviceLUID[#{VK_LUID_SIZE}]",
                                               "uint32_t  deviceNodeMask",
                                               "VkBool32  deviceLUIDValid",
                                               "uint32_t  subgroupSize",
                                               "VkShaderStageFlags  subgroupSupportedStages",
                                               "VkSubgroupFeatureFlags  subgroupSupportedOperations",
                                               "VkBool32  subgroupQuadOperationsInAllStages",
                                               "VkPointClippingBehavior  pointClippingBehavior",
                                               "uint32_t  maxMultiviewViewCount",
                                               "uint32_t  maxMultiviewInstanceIndex",
                                               "VkBool32  protectedNoFault",
                                               "uint32_t  maxPerSetDescriptors",
                                               "VkDeviceSize  maxMemoryAllocationSize"]

  VkPhysicalDeviceVulkan12Features = struct ["VkStructureType  sType",
                                             "void * pNext",
                                             "VkBool32  samplerMirrorClampToEdge",
                                             "VkBool32  drawIndirectCount",
                                             "VkBool32  storageBuffer8BitAccess",
                                             "VkBool32  uniformAndStorageBuffer8BitAccess",
                                             "VkBool32  storagePushConstant8",
                                             "VkBool32  shaderBufferInt64Atomics",
                                             "VkBool32  shaderSharedInt64Atomics",
                                             "VkBool32  shaderFloat16",
                                             "VkBool32  shaderInt8",
                                             "VkBool32  descriptorIndexing",
                                             "VkBool32  shaderInputAttachmentArrayDynamicIndexing",
                                             "VkBool32  shaderUniformTexelBufferArrayDynamicIndexing",
                                             "VkBool32  shaderStorageTexelBufferArrayDynamicIndexing",
                                             "VkBool32  shaderUniformBufferArrayNonUniformIndexing",
                                             "VkBool32  shaderSampledImageArrayNonUniformIndexing",
                                             "VkBool32  shaderStorageBufferArrayNonUniformIndexing",
                                             "VkBool32  shaderStorageImageArrayNonUniformIndexing",
                                             "VkBool32  shaderInputAttachmentArrayNonUniformIndexing",
                                             "VkBool32  shaderUniformTexelBufferArrayNonUniformIndexing",
                                             "VkBool32  shaderStorageTexelBufferArrayNonUniformIndexing",
                                             "VkBool32  descriptorBindingUniformBufferUpdateAfterBind",
                                             "VkBool32  descriptorBindingSampledImageUpdateAfterBind",
                                             "VkBool32  descriptorBindingStorageImageUpdateAfterBind",
                                             "VkBool32  descriptorBindingStorageBufferUpdateAfterBind",
                                             "VkBool32  descriptorBindingUniformTexelBufferUpdateAfterBind",
                                             "VkBool32  descriptorBindingStorageTexelBufferUpdateAfterBind",
                                             "VkBool32  descriptorBindingUpdateUnusedWhilePending",
                                             "VkBool32  descriptorBindingPartiallyBound",
                                             "VkBool32  descriptorBindingVariableDescriptorCount",
                                             "VkBool32  runtimeDescriptorArray",
                                             "VkBool32  samplerFilterMinmax",
                                             "VkBool32  scalarBlockLayout",
                                             "VkBool32  imagelessFramebuffer",
                                             "VkBool32  uniformBufferStandardLayout",
                                             "VkBool32  shaderSubgroupExtendedTypes",
                                             "VkBool32  separateDepthStencilLayouts",
                                             "VkBool32  hostQueryReset",
                                             "VkBool32  timelineSemaphore",
                                             "VkBool32  bufferDeviceAddress",
                                             "VkBool32  bufferDeviceAddressCaptureReplay",
                                             "VkBool32  bufferDeviceAddressMultiDevice",
                                             "VkBool32  vulkanMemoryModel",
                                             "VkBool32  vulkanMemoryModelDeviceScope",
                                             "VkBool32  vulkanMemoryModelAvailabilityVisibilityChains",
                                             "VkBool32  shaderOutputViewportIndex",
                                             "VkBool32  shaderOutputLayer",
                                             "VkBool32  subgroupBroadcastDynamicId"]

  VkPhysicalDeviceVulkan12Properties = struct ["VkStructureType  sType",
                                               "void * pNext",
                                               "VkDriverId  driverID",
                                               "char  driverName[#{VK_MAX_DRIVER_NAME_SIZE}]",
                                               "char  driverInfo[#{VK_MAX_DRIVER_INFO_SIZE}]",
                                               { "conformanceVersion" => VkConformanceVersion },
                                               "VkShaderFloatControlsIndependence  denormBehaviorIndependence",
                                               "VkShaderFloatControlsIndependence  roundingModeIndependence",
                                               "VkBool32  shaderSignedZeroInfNanPreserveFloat16",
                                               "VkBool32  shaderSignedZeroInfNanPreserveFloat32",
                                               "VkBool32  shaderSignedZeroInfNanPreserveFloat64",
                                               "VkBool32  shaderDenormPreserveFloat16",
                                               "VkBool32  shaderDenormPreserveFloat32",
                                               "VkBool32  shaderDenormPreserveFloat64",
                                               "VkBool32  shaderDenormFlushToZeroFloat16",
                                               "VkBool32  shaderDenormFlushToZeroFloat32",
                                               "VkBool32  shaderDenormFlushToZeroFloat64",
                                               "VkBool32  shaderRoundingModeRTEFloat16",
                                               "VkBool32  shaderRoundingModeRTEFloat32",
                                               "VkBool32  shaderRoundingModeRTEFloat64",
                                               "VkBool32  shaderRoundingModeRTZFloat16",
                                               "VkBool32  shaderRoundingModeRTZFloat32",
                                               "VkBool32  shaderRoundingModeRTZFloat64",
                                               "uint32_t  maxUpdateAfterBindDescriptorsInAllPools",
                                               "VkBool32  shaderUniformBufferArrayNonUniformIndexingNative",
                                               "VkBool32  shaderSampledImageArrayNonUniformIndexingNative",
                                               "VkBool32  shaderStorageBufferArrayNonUniformIndexingNative",
                                               "VkBool32  shaderStorageImageArrayNonUniformIndexingNative",
                                               "VkBool32  shaderInputAttachmentArrayNonUniformIndexingNative",
                                               "VkBool32  robustBufferAccessUpdateAfterBind",
                                               "VkBool32  quadDivergentImplicitLod",
                                               "uint32_t  maxPerStageDescriptorUpdateAfterBindSamplers",
                                               "uint32_t  maxPerStageDescriptorUpdateAfterBindUniformBuffers",
                                               "uint32_t  maxPerStageDescriptorUpdateAfterBindStorageBuffers",
                                               "uint32_t  maxPerStageDescriptorUpdateAfterBindSampledImages",
                                               "uint32_t  maxPerStageDescriptorUpdateAfterBindStorageImages",
                                               "uint32_t  maxPerStageDescriptorUpdateAfterBindInputAttachments",
                                               "uint32_t  maxPerStageUpdateAfterBindResources",
                                               "uint32_t  maxDescriptorSetUpdateAfterBindSamplers",
                                               "uint32_t  maxDescriptorSetUpdateAfterBindUniformBuffers",
                                               "uint32_t  maxDescriptorSetUpdateAfterBindUniformBuffersDynamic",
                                               "uint32_t  maxDescriptorSetUpdateAfterBindStorageBuffers",
                                               "uint32_t  maxDescriptorSetUpdateAfterBindStorageBuffersDynamic",
                                               "uint32_t  maxDescriptorSetUpdateAfterBindSampledImages",
                                               "uint32_t  maxDescriptorSetUpdateAfterBindStorageImages",
                                               "uint32_t  maxDescriptorSetUpdateAfterBindInputAttachments",
                                               "VkResolveModeFlags  supportedDepthResolveModes",
                                               "VkResolveModeFlags  supportedStencilResolveModes",
                                               "VkBool32  independentResolveNone",
                                               "VkBool32  independentResolve",
                                               "VkBool32  filterMinmaxSingleComponentFormats",
                                               "VkBool32  filterMinmaxImageComponentMapping",
                                               "uint64_t  maxTimelineSemaphoreValueDifference",
                                               "VkSampleCountFlags  framebufferIntegerColorSampleCounts"]

  VkPhysicalDeviceVulkan13Features = struct ["VkStructureType  sType",
                                             "void * pNext",
                                             "VkBool32  robustImageAccess",
                                             "VkBool32  inlineUniformBlock",
                                             "VkBool32  descriptorBindingInlineUniformBlockUpdateAfterBind",
                                             "VkBool32  pipelineCreationCacheControl",
                                             "VkBool32  privateData",
                                             "VkBool32  shaderDemoteToHelperInvocation",
                                             "VkBool32  shaderTerminateInvocation",
                                             "VkBool32  subgroupSizeControl",
                                             "VkBool32  computeFullSubgroups",
                                             "VkBool32  synchronization2",
                                             "VkBool32  textureCompressionASTC_HDR",
                                             "VkBool32  shaderZeroInitializeWorkgroupMemory",
                                             "VkBool32  dynamicRendering",
                                             "VkBool32  shaderIntegerDotProduct",
                                             "VkBool32  maintenance4"]

  VkPhysicalDeviceVulkan13Properties = struct ["VkStructureType  sType",
                                               "void * pNext",
                                               "uint32_t  minSubgroupSize",
                                               "uint32_t  maxSubgroupSize",
                                               "uint32_t  maxComputeWorkgroupSubgroups",
                                               "VkShaderStageFlags  requiredSubgroupSizeStages",
                                               "uint32_t  maxInlineUniformBlockSize",
                                               "uint32_t  maxPerStageDescriptorInlineUniformBlocks",
                                               "uint32_t  maxPerStageDescriptorUpdateAfterBindInlineUniformBlocks",
                                               "uint32_t  maxDescriptorSetInlineUniformBlocks",
                                               "uint32_t  maxDescriptorSetUpdateAfterBindInlineUniformBlocks",
                                               "uint32_t  maxInlineUniformTotalSize",
                                               "VkBool32  integerDotProduct8BitUnsignedAccelerated",
                                               "VkBool32  integerDotProduct8BitSignedAccelerated",
                                               "VkBool32  integerDotProduct8BitMixedSignednessAccelerated",
                                               "VkBool32  integerDotProduct4x8BitPackedUnsignedAccelerated",
                                               "VkBool32  integerDotProduct4x8BitPackedSignedAccelerated",
                                               "VkBool32  integerDotProduct4x8BitPackedMixedSignednessAccelerated",
                                               "VkBool32  integerDotProduct16BitUnsignedAccelerated",
                                               "VkBool32  integerDotProduct16BitSignedAccelerated",
                                               "VkBool32  integerDotProduct16BitMixedSignednessAccelerated",
                                               "VkBool32  integerDotProduct32BitUnsignedAccelerated",
                                               "VkBool32  integerDotProduct32BitSignedAccelerated",
                                               "VkBool32  integerDotProduct32BitMixedSignednessAccelerated",
                                               "VkBool32  integerDotProduct64BitUnsignedAccelerated",
                                               "VkBool32  integerDotProduct64BitSignedAccelerated",
                                               "VkBool32  integerDotProduct64BitMixedSignednessAccelerated",
                                               "VkBool32  integerDotProductAccumulatingSaturating8BitUnsignedAccelerated",
                                               "VkBool32  integerDotProductAccumulatingSaturating8BitSignedAccelerated",
                                               "VkBool32  integerDotProductAccumulatingSaturating8BitMixedSignednessAccelerated",
                                               "VkBool32  integerDotProductAccumulatingSaturating4x8BitPackedUnsignedAccelerated",
                                               "VkBool32  integerDotProductAccumulatingSaturating4x8BitPackedSignedAccelerated",
                                               "VkBool32  integerDotProductAccumulatingSaturating4x8BitPackedMixedSignednessAccelerated",
                                               "VkBool32  integerDotProductAccumulatingSaturating16BitUnsignedAccelerated",
                                               "VkBool32  integerDotProductAccumulatingSaturating16BitSignedAccelerated",
                                               "VkBool32  integerDotProductAccumulatingSaturating16BitMixedSignednessAccelerated",
                                               "VkBool32  integerDotProductAccumulatingSaturating32BitUnsignedAccelerated",
                                               "VkBool32  integerDotProductAccumulatingSaturating32BitSignedAccelerated",
                                               "VkBool32  integerDotProductAccumulatingSaturating32BitMixedSignednessAccelerated",
                                               "VkBool32  integerDotProductAccumulatingSaturating64BitUnsignedAccelerated",
                                               "VkBool32  integerDotProductAccumulatingSaturating64BitSignedAccelerated",
                                               "VkBool32  integerDotProductAccumulatingSaturating64BitMixedSignednessAccelerated",
                                               "VkDeviceSize  storageTexelBufferOffsetAlignmentBytes",
                                               "VkBool32  storageTexelBufferOffsetSingleTexelAlignment",
                                               "VkDeviceSize  uniformTexelBufferOffsetAlignmentBytes",
                                               "VkBool32  uniformTexelBufferOffsetSingleTexelAlignment",
                                               "VkDeviceSize  maxBufferSize"]

  VkPhysicalDeviceVulkanMemoryModelFeatures = struct ["VkStructureType  sType",
                                                      "void * pNext",
                                                      "VkBool32  vulkanMemoryModel",
                                                      "VkBool32  vulkanMemoryModelDeviceScope",
                                                      "VkBool32  vulkanMemoryModelAvailabilityVisibilityChains"]

  VkPhysicalDeviceVulkanMemoryModelFeaturesKHR = VkPhysicalDeviceVulkanMemoryModelFeatures

  VkPhysicalDeviceWorkgroupMemoryExplicitLayoutFeaturesKHR = struct ["VkStructureType  sType",
                                                                     "void * pNext",
                                                                     "VkBool32  workgroupMemoryExplicitLayout",
                                                                     "VkBool32  workgroupMemoryExplicitLayoutScalarBlockLayout",
                                                                     "VkBool32  workgroupMemoryExplicitLayout8BitAccess",
                                                                     "VkBool32  workgroupMemoryExplicitLayout16BitAccess"]

  VkPhysicalDeviceYcbcr2Plane444FormatsFeaturesEXT = struct ["VkStructureType  sType",
                                                             "void * pNext",
                                                             "VkBool32  ycbcr2plane444Formats"]

  VkPhysicalDeviceYcbcrImageArraysFeaturesEXT = struct ["VkStructureType  sType",
                                                        "void * pNext",
                                                        "VkBool32  ycbcrImageArrays"]

  VkPhysicalDeviceZeroInitializeWorkgroupMemoryFeatures = struct ["VkStructureType  sType",
                                                                  "void * pNext",
                                                                  "VkBool32  shaderZeroInitializeWorkgroupMemory"]

  VkPhysicalDeviceZeroInitializeWorkgroupMemoryFeaturesKHR = VkPhysicalDeviceZeroInitializeWorkgroupMemoryFeatures

  VkPipelineCacheCreateInfo = struct ["VkStructureType  sType",
                                      "void * pNext",
                                      "VkPipelineCacheCreateFlags  flags",
                                      "size_t  initialDataSize",
                                      "void * pInitialData"]

  VkPipelineCacheHeaderVersionOne = struct ["uint32_t  headerSize",
                                            "VkPipelineCacheHeaderVersion  headerVersion",
                                            "uint32_t  vendorID",
                                            "uint32_t  deviceID",
                                            "uint8_t  pipelineCacheUUID[#{VK_UUID_SIZE}]"]

  VkPipelineColorBlendAdvancedStateCreateInfoEXT = struct ["VkStructureType  sType",
                                                           "void * pNext",
                                                           "VkBool32  srcPremultiplied",
                                                           "VkBool32  dstPremultiplied",
                                                           "VkBlendOverlapEXT  blendOverlap"]

  VkPipelineColorWriteCreateInfoEXT = struct ["VkStructureType  sType",
                                              "void * pNext",
                                              "uint32_t  attachmentCount",
                                              "VkBool32 * pColorWriteEnables"]

  VkPipelineCompilerControlCreateInfoAMD = struct ["VkStructureType  sType",
                                                   "void * pNext",
                                                   "VkPipelineCompilerControlFlagsAMD  compilerControlFlags"]

  VkPipelineCoverageModulationStateCreateInfoNV = struct ["VkStructureType  sType",
                                                          "void * pNext",
                                                          "VkPipelineCoverageModulationStateCreateFlagsNV  flags",
                                                          "VkCoverageModulationModeNV  coverageModulationMode",
                                                          "VkBool32  coverageModulationTableEnable",
                                                          "uint32_t  coverageModulationTableCount",
                                                          "float * pCoverageModulationTable"]

  VkPipelineCoverageReductionStateCreateInfoNV = struct ["VkStructureType  sType",
                                                         "void * pNext",
                                                         "VkPipelineCoverageReductionStateCreateFlagsNV  flags",
                                                         "VkCoverageReductionModeNV  coverageReductionMode"]

  VkPipelineCoverageToColorStateCreateInfoNV = struct ["VkStructureType  sType",
                                                       "void * pNext",
                                                       "VkPipelineCoverageToColorStateCreateFlagsNV  flags",
                                                       "VkBool32  coverageToColorEnable",
                                                       "uint32_t  coverageToColorLocation"]

  VkPipelineCreationFeedback = struct ["VkPipelineCreationFeedbackFlags  flags",
                                       "uint64_t  duration"]

  VkPipelineCreationFeedbackCreateInfo = struct ["VkStructureType  sType",
                                                 "void * pNext",
                                                 "VkPipelineCreationFeedback * pPipelineCreationFeedback",
                                                 "uint32_t  pipelineStageCreationFeedbackCount",
                                                 "VkPipelineCreationFeedback * pPipelineStageCreationFeedbacks"]

  VkPipelineCreationFeedbackCreateInfoEXT = VkPipelineCreationFeedbackCreateInfo

  VkPipelineCreationFeedbackEXT = VkPipelineCreationFeedback

  VkPipelineDiscardRectangleStateCreateInfoEXT = struct ["VkStructureType  sType",
                                                         "void * pNext",
                                                         "VkPipelineDiscardRectangleStateCreateFlagsEXT  flags",
                                                         "VkDiscardRectangleModeEXT  discardRectangleMode",
                                                         "uint32_t  discardRectangleCount",
                                                         "VkRect2D * pDiscardRectangles"]

  VkPipelineExecutableInfoKHR = struct ["VkStructureType  sType",
                                        "void * pNext",
                                        "VkPipeline  pipeline",
                                        "uint32_t  executableIndex"]

  VkPipelineExecutableInternalRepresentationKHR = struct ["VkStructureType  sType",
                                                          "void * pNext",
                                                          "char  name[#{VK_MAX_DESCRIPTION_SIZE}]",
                                                          "char  description[#{VK_MAX_DESCRIPTION_SIZE}]",
                                                          "VkBool32  isText",
                                                          "size_t  dataSize",
                                                          "void * pData"]

  VkPipelineExecutablePropertiesKHR = struct ["VkStructureType  sType",
                                              "void * pNext",
                                              "VkShaderStageFlags  stages",
                                              "char  name[#{VK_MAX_DESCRIPTION_SIZE}]",
                                              "char  description[#{VK_MAX_DESCRIPTION_SIZE}]",
                                              "uint32_t  subgroupSize"]

  VkPipelineExecutableStatisticValueKHR = union ["VkBool32  b32",
                                                 "int64_t  i64",
                                                 "uint64_t  u64",
                                                 "double  f64"]
  VkPipelineExecutableStatisticKHR = struct ["VkStructureType  sType",
                                             "void * pNext",
                                             "char  name[#{VK_MAX_DESCRIPTION_SIZE}]",
                                             "char  description[#{VK_MAX_DESCRIPTION_SIZE}]",
                                             "VkPipelineExecutableStatisticFormatKHR  format",
                                             { "value" => VkPipelineExecutableStatisticValueKHR }]

  VkPipelineFragmentShadingRateEnumStateCreateInfoNV = struct ["VkStructureType  sType",
                                                               "void * pNext",
                                                               "VkFragmentShadingRateTypeNV  shadingRateType",
                                                               "VkFragmentShadingRateNV  shadingRate",
                                                               "VkFragmentShadingRateCombinerOpKHR  combinerOps [2]"]

  VkPipelineFragmentShadingRateStateCreateInfoKHR = struct ["VkStructureType  sType",
                                                            "void * pNext",
                                                            { "fragmentSize" => VkExtent2D },
                                                            "VkFragmentShadingRateCombinerOpKHR  combinerOps [2]"]

  VkPipelineInfoKHR = struct ["VkStructureType  sType",
                              "void * pNext",
                              "VkPipeline  pipeline"]

  VkPushConstantRange = struct ["VkShaderStageFlags  stageFlags",
                                "uint32_t  offset",
                                "uint32_t  size"]
  VkPipelineLayoutCreateInfo = struct ["VkStructureType  sType",
                                       "void * pNext",
                                       "VkPipelineLayoutCreateFlags  flags",
                                       "uint32_t  setLayoutCount",
                                       "VkDescriptorSetLayout * pSetLayouts",
                                       "uint32_t  pushConstantRangeCount",
                                       "VkPushConstantRange * pPushConstantRanges"]

  VkPipelineLibraryCreateInfoKHR = struct ["VkStructureType  sType",
                                           "void * pNext",
                                           "uint32_t  libraryCount",
                                           "VkPipeline * pLibraries"]

  VkPipelineRasterizationConservativeStateCreateInfoEXT = struct ["VkStructureType  sType",
                                                                  "void * pNext",
                                                                  "VkPipelineRasterizationConservativeStateCreateFlagsEXT  flags",
                                                                  "VkConservativeRasterizationModeEXT  conservativeRasterizationMode",
                                                                  "float  extraPrimitiveOverestimationSize"]

  VkPipelineRasterizationDepthClipStateCreateInfoEXT = struct ["VkStructureType  sType",
                                                               "void * pNext",
                                                               "VkPipelineRasterizationDepthClipStateCreateFlagsEXT  flags",
                                                               "VkBool32  depthClipEnable"]

  VkPipelineRasterizationLineStateCreateInfoEXT = struct ["VkStructureType  sType",
                                                          "void * pNext",
                                                          "VkLineRasterizationModeEXT  lineRasterizationMode",
                                                          "VkBool32  stippledLineEnable",
                                                          "uint32_t  lineStippleFactor",
                                                          "uint16_t  lineStipplePattern"]

  VkPipelineRasterizationProvokingVertexStateCreateInfoEXT = struct ["VkStructureType  sType",
                                                                     "void * pNext",
                                                                     "VkProvokingVertexModeEXT  provokingVertexMode"]

  VkPipelineRasterizationStateRasterizationOrderAMD = struct ["VkStructureType  sType",
                                                              "void * pNext",
                                                              "VkRasterizationOrderAMD  rasterizationOrder"]

  VkPipelineRasterizationStateStreamCreateInfoEXT = struct ["VkStructureType  sType",
                                                            "void * pNext",
                                                            "VkPipelineRasterizationStateStreamCreateFlagsEXT  flags",
                                                            "uint32_t  rasterizationStream"]

  VkPipelineRenderingCreateInfo = struct ["VkStructureType  sType",
                                          "void * pNext",
                                          "uint32_t  viewMask",
                                          "uint32_t  colorAttachmentCount",
                                          "VkFormat * pColorAttachmentFormats",
                                          "VkFormat  depthAttachmentFormat",
                                          "VkFormat  stencilAttachmentFormat"]

  VkPipelineRenderingCreateInfoKHR = VkPipelineRenderingCreateInfo

  VkPipelineRepresentativeFragmentTestStateCreateInfoNV = struct ["VkStructureType  sType",
                                                                  "void * pNext",
                                                                  "VkBool32  representativeFragmentTestEnable"]

  VkPipelineSampleLocationsStateCreateInfoEXT = struct ["VkStructureType  sType",
                                                        "void * pNext",
                                                        "VkBool32  sampleLocationsEnable",
                                                        { "sampleLocationsInfo" => VkSampleLocationsInfoEXT }]

  VkPipelineShaderStageRequiredSubgroupSizeCreateInfo = struct ["VkStructureType  sType",
                                                                "void * pNext",
                                                                "uint32_t  requiredSubgroupSize"]

  VkPipelineShaderStageRequiredSubgroupSizeCreateInfoEXT = VkPipelineShaderStageRequiredSubgroupSizeCreateInfo

  VkPipelineTessellationDomainOriginStateCreateInfo = struct ["VkStructureType  sType",
                                                              "void * pNext",
                                                              "VkTessellationDomainOrigin  domainOrigin"]

  VkPipelineTessellationDomainOriginStateCreateInfoKHR = VkPipelineTessellationDomainOriginStateCreateInfo

  VkVertexInputBindingDivisorDescriptionEXT = struct ["uint32_t  binding",
                                                      "uint32_t  divisor"]
  VkPipelineVertexInputDivisorStateCreateInfoEXT = struct ["VkStructureType  sType",
                                                           "void * pNext",
                                                           "uint32_t  vertexBindingDivisorCount",
                                                           "VkVertexInputBindingDivisorDescriptionEXT * pVertexBindingDivisors"]

  VkPipelineViewportCoarseSampleOrderStateCreateInfoNV = struct ["VkStructureType  sType",
                                                                 "void * pNext",
                                                                 "VkCoarseSampleOrderTypeNV  sampleOrderType",
                                                                 "uint32_t  customSampleOrderCount",
                                                                 "VkCoarseSampleOrderCustomNV * pCustomSampleOrders"]

  VkPipelineViewportDepthClipControlCreateInfoEXT = struct ["VkStructureType  sType",
                                                            "void * pNext",
                                                            "VkBool32  negativeOneToOne"]

  VkPipelineViewportExclusiveScissorStateCreateInfoNV = struct ["VkStructureType  sType",
                                                                "void * pNext",
                                                                "uint32_t  exclusiveScissorCount",
                                                                "VkRect2D * pExclusiveScissors"]

  VkShadingRatePaletteNV = struct ["uint32_t  shadingRatePaletteEntryCount",
                                   "VkShadingRatePaletteEntryNV * pShadingRatePaletteEntries"]
  VkPipelineViewportShadingRateImageStateCreateInfoNV = struct ["VkStructureType  sType",
                                                                "void * pNext",
                                                                "VkBool32  shadingRateImageEnable",
                                                                "uint32_t  viewportCount",
                                                                "VkShadingRatePaletteNV * pShadingRatePalettes"]

  VkViewportSwizzleNV = struct ["VkViewportCoordinateSwizzleNV  x",
                                "VkViewportCoordinateSwizzleNV  y",
                                "VkViewportCoordinateSwizzleNV  z",
                                "VkViewportCoordinateSwizzleNV  w"]
  VkPipelineViewportSwizzleStateCreateInfoNV = struct ["VkStructureType  sType",
                                                       "void * pNext",
                                                       "VkPipelineViewportSwizzleStateCreateFlagsNV  flags",
                                                       "uint32_t  viewportCount",
                                                       "VkViewportSwizzleNV * pViewportSwizzles"]

  VkViewportWScalingNV = struct ["float  xcoeff",
                                 "float  ycoeff"]
  VkPipelineViewportWScalingStateCreateInfoNV = struct ["VkStructureType  sType",
                                                        "void * pNext",
                                                        "VkBool32  viewportWScalingEnable",
                                                        "uint32_t  viewportCount",
                                                        "VkViewportWScalingNV * pViewportWScalings"]

  VkPresentFrameTokenGGP = struct ["VkStructureType  sType",
                                   "void * pNext",
                                   "GgpFrameToken  frameToken"]

  VkPresentIdKHR = struct ["VkStructureType  sType",
                           "void * pNext",
                           "uint32_t  swapchainCount",
                           "uint64_t * pPresentIds"]

  VkPresentInfoKHR = struct ["VkStructureType  sType",
                             "void * pNext",
                             "uint32_t  waitSemaphoreCount",
                             "VkSemaphore * pWaitSemaphores",
                             "uint32_t  swapchainCount",
                             "VkSwapchainKHR * pSwapchains",
                             "uint32_t * pImageIndices",
                             "VkResult * pResults"]

  VkRectLayerKHR = struct [{ "offset" => VkOffset2D },
                           { "extent" => VkExtent2D },
                           "uint32_t  layer"]
  VkPresentRegionKHR = struct ["uint32_t  rectangleCount",
                               "VkRectLayerKHR * pRectangles"]

  VkPresentRegionsKHR = struct ["VkStructureType  sType",
                                "void * pNext",
                                "uint32_t  swapchainCount",
                                "VkPresentRegionKHR * pRegions"]

  VkPresentTimeGOOGLE = struct ["uint32_t  presentID",
                                "uint64_t  desiredPresentTime"]

  VkPresentTimesInfoGOOGLE = struct ["VkStructureType  sType",
                                     "void * pNext",
                                     "uint32_t  swapchainCount",
                                     "VkPresentTimeGOOGLE * pTimes"]

  VkPrivateDataSlotCreateInfo = struct ["VkStructureType  sType",
                                        "void * pNext",
                                        "VkPrivateDataSlotCreateFlags  flags"]

  VkPrivateDataSlotCreateInfoEXT = VkPrivateDataSlotCreateInfo

  VkProtectedSubmitInfo = struct ["VkStructureType  sType",
                                  "void * pNext",
                                  "VkBool32  protectedSubmit"]

  VkQueryPoolCreateInfo = struct ["VkStructureType  sType",
                                  "void * pNext",
                                  "VkQueryPoolCreateFlags  flags",
                                  "VkQueryType  queryType",
                                  "uint32_t  queryCount",
                                  "VkQueryPipelineStatisticFlags  pipelineStatistics"]

  VkQueryPoolPerformanceQueryCreateInfoINTEL = struct ["VkStructureType  sType",
                                                       "void * pNext",
                                                       "VkQueryPoolSamplingModeINTEL  performanceCountersSampling"]
  VkQueryPoolCreateInfoINTEL = VkQueryPoolPerformanceQueryCreateInfoINTEL

  VkQueryPoolPerformanceCreateInfoKHR = struct ["VkStructureType  sType",
                                                "void * pNext",
                                                "uint32_t  queueFamilyIndex",
                                                "uint32_t  counterIndexCount",
                                                "uint32_t * pCounterIndices"]

  VkQueueFamilyCheckpointProperties2NV = struct ["VkStructureType  sType",
                                                 "void * pNext",
                                                 "VkPipelineStageFlags2  checkpointExecutionStageMask"]

  VkQueueFamilyCheckpointPropertiesNV = struct ["VkStructureType  sType",
                                                "void * pNext",
                                                "VkPipelineStageFlags  checkpointExecutionStageMask"]

  VkQueueFamilyGlobalPriorityPropertiesKHR = struct ["VkStructureType  sType",
                                                     "void * pNext",
                                                     "uint32_t  priorityCount",
                                                     "VkQueueGlobalPriorityKHR  priorities[#{VK_MAX_GLOBAL_PRIORITY_SIZE_KHR}]"]
  VkQueueFamilyGlobalPriorityPropertiesEXT = VkQueueFamilyGlobalPriorityPropertiesKHR

  VkQueueFamilyProperties = struct ["VkQueueFlags  queueFlags",
                                    "uint32_t  queueCount",
                                    "uint32_t  timestampValidBits",
                                    { "minImageTransferGranularity" => VkExtent3D }]

  VkQueueFamilyProperties2 = struct ["VkStructureType  sType",
                                     "void * pNext",
                                     { "queueFamilyProperties" => VkQueueFamilyProperties }]

  VkQueueFamilyProperties2KHR = VkQueueFamilyProperties2

  VkQueueFamilyQueryResultStatusProperties2KHR = struct ["VkStructureType  sType",
                                                         "void * pNext",
                                                         "VkBool32  supported"]

  VkRayTracingShaderGroupCreateInfoKHR = struct ["VkStructureType  sType",
                                                 "void * pNext",
                                                 "VkRayTracingShaderGroupTypeKHR  type",
                                                 "uint32_t  generalShader",
                                                 "uint32_t  closestHitShader",
                                                 "uint32_t  anyHitShader",
                                                 "uint32_t  intersectionShader",
                                                 "void * pShaderGroupCaptureReplayHandle"]
  VkRayTracingPipelineInterfaceCreateInfoKHR = struct ["VkStructureType  sType",
                                                       "void * pNext",
                                                       "uint32_t  maxPipelineRayPayloadSize",
                                                       "uint32_t  maxPipelineRayHitAttributeSize"]
  VkRayTracingPipelineCreateInfoKHR = struct ["VkStructureType  sType",
                                              "void * pNext",
                                              "VkPipelineCreateFlags  flags",
                                              "uint32_t  stageCount",
                                              "VkPipelineShaderStageCreateInfo * pStages",
                                              "uint32_t  groupCount",
                                              "VkRayTracingShaderGroupCreateInfoKHR * pGroups",
                                              "uint32_t  maxPipelineRayRecursionDepth",
                                              "VkPipelineLibraryCreateInfoKHR * pLibraryInfo",
                                              "VkRayTracingPipelineInterfaceCreateInfoKHR * pLibraryInterface",
                                              "VkPipelineDynamicStateCreateInfo * pDynamicState",
                                              "VkPipelineLayout  layout",
                                              "VkPipeline  basePipelineHandle",
                                              "int32_t  basePipelineIndex"]

  VkRayTracingShaderGroupCreateInfoNV = struct ["VkStructureType  sType",
                                                "void * pNext",
                                                "VkRayTracingShaderGroupTypeKHR  type",
                                                "uint32_t  generalShader",
                                                "uint32_t  closestHitShader",
                                                "uint32_t  anyHitShader",
                                                "uint32_t  intersectionShader"]
  VkRayTracingPipelineCreateInfoNV = struct ["VkStructureType  sType",
                                             "void * pNext",
                                             "VkPipelineCreateFlags  flags",
                                             "uint32_t  stageCount",
                                             "VkPipelineShaderStageCreateInfo * pStages",
                                             "uint32_t  groupCount",
                                             "VkRayTracingShaderGroupCreateInfoNV * pGroups",
                                             "uint32_t  maxRecursionDepth",
                                             "VkPipelineLayout  layout",
                                             "VkPipeline  basePipelineHandle",
                                             "int32_t  basePipelineIndex"]

  VkRefreshCycleDurationGOOGLE = struct ["uint64_t  refreshDuration"]

  VkRenderPassAttachmentBeginInfo = struct ["VkStructureType  sType",
                                            "void * pNext",
                                            "uint32_t  attachmentCount",
                                            "VkImageView * pAttachments"]

  VkRenderPassAttachmentBeginInfoKHR = VkRenderPassAttachmentBeginInfo

  VkRenderPassBeginInfo = struct ["VkStructureType  sType",
                                  "void * pNext",
                                  "VkRenderPass  renderPass",
                                  "VkFramebuffer  framebuffer",
                                  { "renderArea" => VkRect2D },
                                  "uint32_t  clearValueCount",
                                  "VkClearValue * pClearValues"]

  VkSubpassDescription = struct ["VkSubpassDescriptionFlags  flags",
                                 "VkPipelineBindPoint  pipelineBindPoint",
                                 "uint32_t  inputAttachmentCount",
                                 "VkAttachmentReference * pInputAttachments",
                                 "uint32_t  colorAttachmentCount",
                                 "VkAttachmentReference * pColorAttachments",
                                 "VkAttachmentReference * pResolveAttachments",
                                 "VkAttachmentReference * pDepthStencilAttachment",
                                 "uint32_t  preserveAttachmentCount",
                                 "uint32_t * pPreserveAttachments"]
  VkSubpassDependency = struct ["uint32_t  srcSubpass",
                                "uint32_t  dstSubpass",
                                "VkPipelineStageFlags  srcStageMask",
                                "VkPipelineStageFlags  dstStageMask",
                                "VkAccessFlags  srcAccessMask",
                                "VkAccessFlags  dstAccessMask",
                                "VkDependencyFlags  dependencyFlags"]
  VkRenderPassCreateInfo = struct ["VkStructureType  sType",
                                   "void * pNext",
                                   "VkRenderPassCreateFlags  flags",
                                   "uint32_t  attachmentCount",
                                   "VkAttachmentDescription * pAttachments",
                                   "uint32_t  subpassCount",
                                   "VkSubpassDescription * pSubpasses",
                                   "uint32_t  dependencyCount",
                                   "VkSubpassDependency * pDependencies"]

  VkSubpassDescription2 = struct ["VkStructureType  sType",
                                  "void * pNext",
                                  "VkSubpassDescriptionFlags  flags",
                                  "VkPipelineBindPoint  pipelineBindPoint",
                                  "uint32_t  viewMask",
                                  "uint32_t  inputAttachmentCount",
                                  "VkAttachmentReference2 * pInputAttachments",
                                  "uint32_t  colorAttachmentCount",
                                  "VkAttachmentReference2 * pColorAttachments",
                                  "VkAttachmentReference2 * pResolveAttachments",
                                  "VkAttachmentReference2 * pDepthStencilAttachment",
                                  "uint32_t  preserveAttachmentCount",
                                  "uint32_t * pPreserveAttachments"]
  VkSubpassDependency2 = struct ["VkStructureType  sType",
                                 "void * pNext",
                                 "uint32_t  srcSubpass",
                                 "uint32_t  dstSubpass",
                                 "VkPipelineStageFlags  srcStageMask",
                                 "VkPipelineStageFlags  dstStageMask",
                                 "VkAccessFlags  srcAccessMask",
                                 "VkAccessFlags  dstAccessMask",
                                 "VkDependencyFlags  dependencyFlags",
                                 "int32_t  viewOffset"]
  VkRenderPassCreateInfo2 = struct ["VkStructureType  sType",
                                    "void * pNext",
                                    "VkRenderPassCreateFlags  flags",
                                    "uint32_t  attachmentCount",
                                    "VkAttachmentDescription2 * pAttachments",
                                    "uint32_t  subpassCount",
                                    "VkSubpassDescription2 * pSubpasses",
                                    "uint32_t  dependencyCount",
                                    "VkSubpassDependency2 * pDependencies",
                                    "uint32_t  correlatedViewMaskCount",
                                    "uint32_t * pCorrelatedViewMasks"]

  VkRenderPassCreateInfo2KHR = VkRenderPassCreateInfo2

  VkRenderPassFragmentDensityMapCreateInfoEXT = struct ["VkStructureType  sType",
                                                        "void * pNext",
                                                        { "fragmentDensityMapAttachment" => VkAttachmentReference }]

  VkRenderPassInputAttachmentAspectCreateInfo = struct ["VkStructureType  sType",
                                                        "void * pNext",
                                                        "uint32_t  aspectReferenceCount",
                                                        "VkInputAttachmentAspectReference * pAspectReferences"]

  VkRenderPassInputAttachmentAspectCreateInfoKHR = VkRenderPassInputAttachmentAspectCreateInfo

  VkRenderPassMultiviewCreateInfo = struct ["VkStructureType  sType",
                                            "void * pNext",
                                            "uint32_t  subpassCount",
                                            "uint32_t * pViewMasks",
                                            "uint32_t  dependencyCount",
                                            "int32_t * pViewOffsets",
                                            "uint32_t  correlationMaskCount",
                                            "uint32_t * pCorrelationMasks"]

  VkRenderPassMultiviewCreateInfoKHR = VkRenderPassMultiviewCreateInfo

  VkSubpassSampleLocationsEXT = struct ["uint32_t  subpassIndex",
                                        { "sampleLocationsInfo" => VkSampleLocationsInfoEXT }]
  VkRenderPassSampleLocationsBeginInfoEXT = struct ["VkStructureType  sType",
                                                    "void * pNext",
                                                    "uint32_t  attachmentInitialSampleLocationsCount",
                                                    "VkAttachmentSampleLocationsEXT * pAttachmentInitialSampleLocations",
                                                    "uint32_t  postSubpassSampleLocationsCount",
                                                    "VkSubpassSampleLocationsEXT * pPostSubpassSampleLocations"]

  VkRenderPassTransformBeginInfoQCOM = struct ["VkStructureType  sType",
                                               "void * pNext",
                                               "VkSurfaceTransformFlagBitsKHR  transform"]

  VkRenderingAttachmentInfo = struct ["VkStructureType  sType",
                                      "void * pNext",
                                      "VkImageView  imageView",
                                      "VkImageLayout  imageLayout",
                                      "VkResolveModeFlagBits  resolveMode",
                                      "VkImageView  resolveImageView",
                                      "VkImageLayout  resolveImageLayout",
                                      "VkAttachmentLoadOp  loadOp",
                                      "VkAttachmentStoreOp  storeOp",
                                      { "clearValue" => VkClearValue }]

  VkRenderingAttachmentInfoKHR = VkRenderingAttachmentInfo

  VkRenderingFragmentDensityMapAttachmentInfoEXT = struct ["VkStructureType  sType",
                                                           "void * pNext",
                                                           "VkImageView  imageView",
                                                           "VkImageLayout  imageLayout"]

  VkRenderingFragmentShadingRateAttachmentInfoKHR = struct ["VkStructureType  sType",
                                                            "void * pNext",
                                                            "VkImageView  imageView",
                                                            "VkImageLayout  imageLayout",
                                                            { "shadingRateAttachmentTexelSize" => VkExtent2D }]

  VkRenderingInfo = struct ["VkStructureType  sType",
                            "void * pNext",
                            "VkRenderingFlags  flags",
                            { "renderArea" => VkRect2D },
                            "uint32_t  layerCount",
                            "uint32_t  viewMask",
                            "uint32_t  colorAttachmentCount",
                            "VkRenderingAttachmentInfo * pColorAttachments",
                            "VkRenderingAttachmentInfo * pDepthAttachment",
                            "VkRenderingAttachmentInfo * pStencilAttachment"]

  VkRenderingInfoKHR = VkRenderingInfo

  VkResolveImageInfo2 = struct ["VkStructureType  sType",
                                "void * pNext",
                                "VkImage  srcImage",
                                "VkImageLayout  srcImageLayout",
                                "VkImage  dstImage",
                                "VkImageLayout  dstImageLayout",
                                "uint32_t  regionCount",
                                "VkImageResolve2 * pRegions"]

  VkResolveImageInfo2KHR = VkResolveImageInfo2

  VkSamplerBorderColorComponentMappingCreateInfoEXT = struct ["VkStructureType  sType",
                                                              "void * pNext",
                                                              { "components" => VkComponentMapping },
                                                              "VkBool32  srgb"]

  VkSamplerCreateInfo = struct ["VkStructureType  sType",
                                "void * pNext",
                                "VkSamplerCreateFlags  flags",
                                "VkFilter  magFilter",
                                "VkFilter  minFilter",
                                "VkSamplerMipmapMode  mipmapMode",
                                "VkSamplerAddressMode  addressModeU",
                                "VkSamplerAddressMode  addressModeV",
                                "VkSamplerAddressMode  addressModeW",
                                "float  mipLodBias",
                                "VkBool32  anisotropyEnable",
                                "float  maxAnisotropy",
                                "VkBool32  compareEnable",
                                "VkCompareOp  compareOp",
                                "float  minLod",
                                "float  maxLod",
                                "VkBorderColor  borderColor",
                                "VkBool32  unnormalizedCoordinates"]

  VkSamplerCustomBorderColorCreateInfoEXT = struct ["VkStructureType  sType",
                                                    "void * pNext",
                                                    { "customBorderColor" => VkClearColorValue },
                                                    "VkFormat  format"]

  VkSamplerReductionModeCreateInfo = struct ["VkStructureType  sType",
                                             "void * pNext",
                                             "VkSamplerReductionMode  reductionMode"]

  VkSamplerReductionModeCreateInfoEXT = VkSamplerReductionModeCreateInfo

  VkSamplerYcbcrConversionCreateInfo = struct ["VkStructureType  sType",
                                               "void * pNext",
                                               "VkFormat  format",
                                               "VkSamplerYcbcrModelConversion  ycbcrModel",
                                               "VkSamplerYcbcrRange  ycbcrRange",
                                               { "components" => VkComponentMapping },
                                               "VkChromaLocation  xChromaOffset",
                                               "VkChromaLocation  yChromaOffset",
                                               "VkFilter  chromaFilter",
                                               "VkBool32  forceExplicitReconstruction"]

  VkSamplerYcbcrConversionCreateInfoKHR = VkSamplerYcbcrConversionCreateInfo

  VkSamplerYcbcrConversionImageFormatProperties = struct ["VkStructureType  sType",
                                                          "void * pNext",
                                                          "uint32_t  combinedImageSamplerDescriptorCount"]

  VkSamplerYcbcrConversionImageFormatPropertiesKHR = VkSamplerYcbcrConversionImageFormatProperties

  VkSamplerYcbcrConversionInfo = struct ["VkStructureType  sType",
                                         "void * pNext",
                                         "VkSamplerYcbcrConversion  conversion"]

  VkSamplerYcbcrConversionInfoKHR = VkSamplerYcbcrConversionInfo

  VkScreenSurfaceCreateInfoQNX = struct ["VkStructureType  sType",
                                         "void * pNext",
                                         "VkScreenSurfaceCreateFlagsQNX  flags",
                                         "_screen_context * context",
                                         "_screen_window * window"]

  VkSemaphoreCreateInfo = struct ["VkStructureType  sType",
                                  "void * pNext",
                                  "VkSemaphoreCreateFlags  flags"]

  VkSemaphoreGetFdInfoKHR = struct ["VkStructureType  sType",
                                    "void * pNext",
                                    "VkSemaphore  semaphore",
                                    "VkExternalSemaphoreHandleTypeFlagBits  handleType"]

  VkSemaphoreGetWin32HandleInfoKHR = struct ["VkStructureType  sType",
                                             "void * pNext",
                                             "VkSemaphore  semaphore",
                                             "VkExternalSemaphoreHandleTypeFlagBits  handleType"]

  VkSemaphoreGetZirconHandleInfoFUCHSIA = struct ["VkStructureType  sType",
                                                  "void * pNext",
                                                  "VkSemaphore  semaphore",
                                                  "VkExternalSemaphoreHandleTypeFlagBits  handleType"]

  VkSemaphoreSignalInfo = struct ["VkStructureType  sType",
                                  "void * pNext",
                                  "VkSemaphore  semaphore",
                                  "uint64_t  value"]

  VkSemaphoreSignalInfoKHR = VkSemaphoreSignalInfo

  VkSemaphoreSubmitInfo = struct ["VkStructureType  sType",
                                  "void * pNext",
                                  "VkSemaphore  semaphore",
                                  "uint64_t  value",
                                  "VkPipelineStageFlags2  stageMask",
                                  "uint32_t  deviceIndex"]

  VkSemaphoreSubmitInfoKHR = VkSemaphoreSubmitInfo

  VkSemaphoreTypeCreateInfo = struct ["VkStructureType  sType",
                                      "void * pNext",
                                      "VkSemaphoreType  semaphoreType",
                                      "uint64_t  initialValue"]

  VkSemaphoreTypeCreateInfoKHR = VkSemaphoreTypeCreateInfo

  VkSemaphoreWaitInfo = struct ["VkStructureType  sType",
                                "void * pNext",
                                "VkSemaphoreWaitFlags  flags",
                                "uint32_t  semaphoreCount",
                                "VkSemaphore * pSemaphores",
                                "uint64_t * pValues"]

  VkSemaphoreWaitInfoKHR = VkSemaphoreWaitInfo

  VkSetStateFlagsIndirectCommandNV = struct ["uint32_t  data"]

  VkShaderModuleCreateInfo = struct ["VkStructureType  sType",
                                     "void * pNext",
                                     "VkShaderModuleCreateFlags  flags",
                                     "size_t  codeSize",
                                     "uint32_t * pCode"]

  VkShaderModuleValidationCacheCreateInfoEXT = struct ["VkStructureType  sType",
                                                       "void * pNext",
                                                       "VkValidationCacheEXT  validationCache"]

  VkShaderResourceUsageAMD = struct ["uint32_t  numUsedVgprs",
                                     "uint32_t  numUsedSgprs",
                                     "uint32_t  ldsSizePerLocalWorkGroup",
                                     "size_t  ldsUsageSizeInBytes",
                                     "size_t  scratchMemUsageInBytes"]

  VkShaderStatisticsInfoAMD = struct ["VkShaderStageFlags  shaderStageMask",
                                      { "resourceUsage" => VkShaderResourceUsageAMD },
                                      "uint32_t  numPhysicalVgprs",
                                      "uint32_t  numPhysicalSgprs",
                                      "uint32_t  numAvailableVgprs",
                                      "uint32_t  numAvailableSgprs",
                                      "uint32_t  computeWorkGroupSize [3]"]

  VkSharedPresentSurfaceCapabilitiesKHR = struct ["VkStructureType  sType",
                                                  "void * pNext",
                                                  "VkImageUsageFlags  sharedPresentSupportedUsageFlags"]

  VkSparseImageFormatProperties = struct ["VkImageAspectFlags  aspectMask",
                                          { "imageGranularity" => VkExtent3D },
                                          "VkSparseImageFormatFlags  flags"]

  VkSparseImageFormatProperties2 = struct ["VkStructureType  sType",
                                           "void * pNext",
                                           { "properties" => VkSparseImageFormatProperties }]

  VkSparseImageFormatProperties2KHR = VkSparseImageFormatProperties2

  VkSparseImageMemoryRequirements = struct [{ "formatProperties" => VkSparseImageFormatProperties },
                                            "uint32_t  imageMipTailFirstLod",
                                            "VkDeviceSize  imageMipTailSize",
                                            "VkDeviceSize  imageMipTailOffset",
                                            "VkDeviceSize  imageMipTailStride"]

  VkSparseImageMemoryRequirements2 = struct ["VkStructureType  sType",
                                             "void * pNext",
                                             { "memoryRequirements" => VkSparseImageMemoryRequirements }]

  VkSparseImageMemoryRequirements2KHR = VkSparseImageMemoryRequirements2

  VkStreamDescriptorSurfaceCreateInfoGGP = struct ["VkStructureType  sType",
                                                   "void * pNext",
                                                   "VkStreamDescriptorSurfaceCreateFlagsGGP  flags",
                                                   "GgpStreamDescriptor  streamDescriptor"]

  VkStridedDeviceAddressRegionKHR = struct ["VkDeviceAddress  deviceAddress",
                                            "VkDeviceSize  stride",
                                            "VkDeviceSize  size"]

  VkSubmitInfo = struct ["VkStructureType  sType",
                         "void * pNext",
                         "uint32_t  waitSemaphoreCount",
                         "VkSemaphore * pWaitSemaphores",
                         "VkPipelineStageFlags * pWaitDstStageMask",
                         "uint32_t  commandBufferCount",
                         "VkCommandBuffer * pCommandBuffers",
                         "uint32_t  signalSemaphoreCount",
                         "VkSemaphore * pSignalSemaphores"]

  VkSubmitInfo2 = struct ["VkStructureType  sType",
                          "void * pNext",
                          "VkSubmitFlags  flags",
                          "uint32_t  waitSemaphoreInfoCount",
                          "VkSemaphoreSubmitInfo * pWaitSemaphoreInfos",
                          "uint32_t  commandBufferInfoCount",
                          "VkCommandBufferSubmitInfo * pCommandBufferInfos",
                          "uint32_t  signalSemaphoreInfoCount",
                          "VkSemaphoreSubmitInfo * pSignalSemaphoreInfos"]

  VkSubmitInfo2KHR = VkSubmitInfo2

  VkSubpassBeginInfo = struct ["VkStructureType  sType",
                               "void * pNext",
                               "VkSubpassContents  contents"]

  VkSubpassBeginInfoKHR = VkSubpassBeginInfo

  VkSubpassDependency2KHR = VkSubpassDependency2

  VkSubpassDescription2KHR = VkSubpassDescription2

  VkSubpassDescriptionDepthStencilResolve = struct ["VkStructureType  sType",
                                                    "void * pNext",
                                                    "VkResolveModeFlagBits  depthResolveMode",
                                                    "VkResolveModeFlagBits  stencilResolveMode",
                                                    "VkAttachmentReference2 * pDepthStencilResolveAttachment"]

  VkSubpassDescriptionDepthStencilResolveKHR = VkSubpassDescriptionDepthStencilResolve

  VkSubpassEndInfo = struct ["VkStructureType  sType",
                             "void * pNext"]

  VkSubpassEndInfoKHR = VkSubpassEndInfo

  VkSubpassFragmentDensityMapOffsetEndInfoQCOM = struct ["VkStructureType  sType",
                                                         "void * pNext",
                                                         "uint32_t  fragmentDensityOffsetCount",
                                                         "VkOffset2D * pFragmentDensityOffsets"]

  VkSubpassShadingPipelineCreateInfoHUAWEI = struct ["VkStructureType  sType",
                                                     "void * pNext",
                                                     "VkRenderPass  renderPass",
                                                     "uint32_t  subpass"]

  VkSurfaceCapabilities2EXT = struct ["VkStructureType  sType",
                                      "void * pNext",
                                      "uint32_t  minImageCount",
                                      "uint32_t  maxImageCount",
                                      { "currentExtent" => VkExtent2D },
                                      { "minImageExtent" => VkExtent2D },
                                      { "maxImageExtent" => VkExtent2D },
                                      "uint32_t  maxImageArrayLayers",
                                      "VkSurfaceTransformFlagsKHR  supportedTransforms",
                                      "VkSurfaceTransformFlagBitsKHR  currentTransform",
                                      "VkCompositeAlphaFlagsKHR  supportedCompositeAlpha",
                                      "VkImageUsageFlags  supportedUsageFlags",
                                      "VkSurfaceCounterFlagsEXT  supportedSurfaceCounters"]

  VkSurfaceCapabilitiesKHR = struct ["uint32_t  minImageCount",
                                     "uint32_t  maxImageCount",
                                     { "currentExtent" => VkExtent2D },
                                     { "minImageExtent" => VkExtent2D },
                                     { "maxImageExtent" => VkExtent2D },
                                     "uint32_t  maxImageArrayLayers",
                                     "VkSurfaceTransformFlagsKHR  supportedTransforms",
                                     "VkSurfaceTransformFlagBitsKHR  currentTransform",
                                     "VkCompositeAlphaFlagsKHR  supportedCompositeAlpha",
                                     "VkImageUsageFlags  supportedUsageFlags"]
  VkSurfaceCapabilities2KHR = struct ["VkStructureType  sType",
                                      "void * pNext",
                                      { "surfaceCapabilities" => VkSurfaceCapabilitiesKHR }]

  VkSurfaceCapabilitiesFullScreenExclusiveEXT = struct ["VkStructureType  sType",
                                                        "void * pNext",
                                                        "VkBool32  fullScreenExclusiveSupported"]

  VkSurfaceFormatKHR = struct ["VkFormat  format",
                               "VkColorSpaceKHR  colorSpace"]
  VkSurfaceFormat2KHR = struct ["VkStructureType  sType",
                                "void * pNext",
                                { "surfaceFormat" => VkSurfaceFormatKHR }]

  VkSurfaceFullScreenExclusiveInfoEXT = struct ["VkStructureType  sType",
                                                "void * pNext",
                                                "VkFullScreenExclusiveEXT  fullScreenExclusive"]

  VkSurfaceFullScreenExclusiveWin32InfoEXT = struct ["VkStructureType  sType",
                                                     "void * pNext",
                                                     "HMONITOR  hmonitor"]

  VkSurfaceProtectedCapabilitiesKHR = struct ["VkStructureType  sType",
                                              "void * pNext",
                                              "VkBool32  supportsProtected"]

  VkSwapchainCounterCreateInfoEXT = struct ["VkStructureType  sType",
                                            "void * pNext",
                                            "VkSurfaceCounterFlagsEXT  surfaceCounters"]

  VkSwapchainCreateInfoKHR = struct ["VkStructureType  sType",
                                     "void * pNext",
                                     "VkSwapchainCreateFlagsKHR  flags",
                                     "VkSurfaceKHR  surface",
                                     "uint32_t  minImageCount",
                                     "VkFormat  imageFormat",
                                     "VkColorSpaceKHR  imageColorSpace",
                                     { "imageExtent" => VkExtent2D },
                                     "uint32_t  imageArrayLayers",
                                     "VkImageUsageFlags  imageUsage",
                                     "VkSharingMode  imageSharingMode",
                                     "uint32_t  queueFamilyIndexCount",
                                     "uint32_t * pQueueFamilyIndices",
                                     "VkSurfaceTransformFlagBitsKHR  preTransform",
                                     "VkCompositeAlphaFlagBitsKHR  compositeAlpha",
                                     "VkPresentModeKHR  presentMode",
                                     "VkBool32  clipped",
                                     "VkSwapchainKHR  oldSwapchain"]

  VkSwapchainDisplayNativeHdrCreateInfoAMD = struct ["VkStructureType  sType",
                                                     "void * pNext",
                                                     "VkBool32  localDimmingEnable"]

  VkSwapchainImageCreateInfoANDROID = struct ["VkStructureType  sType",
                                              "void * pNext",
                                              "VkSwapchainImageUsageFlagsANDROID  usage"]

  VkTextureLODGatherFormatPropertiesAMD = struct ["VkStructureType  sType",
                                                  "void * pNext",
                                                  "VkBool32  supportsTextureGatherLODBiasAMD"]

  VkTimelineSemaphoreSubmitInfo = struct ["VkStructureType  sType",
                                          "void * pNext",
                                          "uint32_t  waitSemaphoreValueCount",
                                          "uint64_t * pWaitSemaphoreValues",
                                          "uint32_t  signalSemaphoreValueCount",
                                          "uint64_t * pSignalSemaphoreValues"]

  VkTimelineSemaphoreSubmitInfoKHR = VkTimelineSemaphoreSubmitInfo

  VkTraceRaysIndirectCommandKHR = struct ["uint32_t  width",
                                          "uint32_t  height",
                                          "uint32_t  depth"]

  VkTransformMatrixNV = VkTransformMatrixKHR

  VkValidationCacheCreateInfoEXT = struct ["VkStructureType  sType",
                                           "void * pNext",
                                           "VkValidationCacheCreateFlagsEXT  flags",
                                           "size_t  initialDataSize",
                                           "void * pInitialData"]

  VkValidationFeaturesEXT = struct ["VkStructureType  sType",
                                    "void * pNext",
                                    "uint32_t  enabledValidationFeatureCount",
                                    "VkValidationFeatureEnableEXT * pEnabledValidationFeatures",
                                    "uint32_t  disabledValidationFeatureCount",
                                    "VkValidationFeatureDisableEXT * pDisabledValidationFeatures"]

  VkValidationFlagsEXT = struct ["VkStructureType  sType",
                                 "void * pNext",
                                 "uint32_t  disabledValidationCheckCount",
                                 "VkValidationCheckEXT * pDisabledValidationChecks"]

  VkVertexInputAttributeDescription2EXT = struct ["VkStructureType  sType",
                                                  "void * pNext",
                                                  "uint32_t  location",
                                                  "uint32_t  binding",
                                                  "VkFormat  format",
                                                  "uint32_t  offset"]

  VkVertexInputBindingDescription2EXT = struct ["VkStructureType  sType",
                                                "void * pNext",
                                                "uint32_t  binding",
                                                "uint32_t  stride",
                                                "VkVertexInputRate  inputRate",
                                                "uint32_t  divisor"]

  VkViSurfaceCreateInfoNN = struct ["VkStructureType  sType",
                                    "void * pNext",
                                    "VkViSurfaceCreateFlagsNN  flags",
                                    "void * window"]

  VkVideoPictureResourceKHR = struct ["VkStructureType  sType",
                                      "void * pNext",
                                      { "codedOffset" => VkOffset2D },
                                      { "codedExtent" => VkExtent2D },
                                      "uint32_t  baseArrayLayer",
                                      "VkImageView  imageViewBinding"]
  VkVideoReferenceSlotKHR = struct ["VkStructureType  sType",
                                    "void * pNext",
                                    "int8_t  slotIndex",
                                    "VkVideoPictureResourceKHR * pPictureResource"]
  VkVideoBeginCodingInfoKHR = struct ["VkStructureType  sType",
                                      "void * pNext",
                                      "VkVideoBeginCodingFlagsKHR  flags",
                                      "VkVideoCodingQualityPresetFlagsKHR  codecQualityPreset",
                                      "VkVideoSessionKHR  videoSession",
                                      "VkVideoSessionParametersKHR  videoSessionParameters",
                                      "uint32_t  referenceSlotCount",
                                      "VkVideoReferenceSlotKHR * pReferenceSlots"]

  VkVideoBindMemoryKHR = struct ["VkStructureType  sType",
                                 "void * pNext",
                                 "uint32_t  memoryBindIndex",
                                 "VkDeviceMemory  memory",
                                 "VkDeviceSize  memoryOffset",
                                 "VkDeviceSize  memorySize"]

  VkVideoCapabilitiesKHR = struct ["VkStructureType  sType",
                                   "void * pNext",
                                   "VkVideoCapabilityFlagsKHR  capabilityFlags",
                                   "VkDeviceSize  minBitstreamBufferOffsetAlignment",
                                   "VkDeviceSize  minBitstreamBufferSizeAlignment",
                                   { "videoPictureExtentGranularity" => VkExtent2D },
                                   { "minExtent" => VkExtent2D },
                                   { "maxExtent" => VkExtent2D },
                                   "uint32_t  maxReferencePicturesSlotsCount",
                                   "uint32_t  maxReferencePicturesActiveCount"]

  VkVideoCodingControlInfoKHR = struct ["VkStructureType  sType",
                                        "void * pNext",
                                        "VkVideoCodingControlFlagsKHR  flags"]

  VkVideoDecodeCapabilitiesKHR = struct ["VkStructureType  sType",
                                         "void * pNext",
                                         "VkVideoDecodeCapabilityFlagsKHR  flags"]

  VkVideoDecodeH264CapabilitiesEXT = struct ["VkStructureType  sType",
                                             "void * pNext",
                                             "uint32_t  maxLevel",
                                             { "fieldOffsetGranularity" => VkOffset2D },
                                             { "stdExtensionVersion" => VkExtensionProperties }]

  VkVideoDecodeH264DpbSlotInfoEXT = struct ["VkStructureType  sType",
                                            "void * pNext",
                                            "StdVideoDecodeH264ReferenceInfo * pStdReferenceInfo"]

  VkVideoDecodeH264MvcEXT = struct ["VkStructureType  sType",
                                    "void * pNext",
                                    "StdVideoDecodeH264Mvc * pStdMvc"]

  VkVideoDecodeH264PictureInfoEXT = struct ["VkStructureType  sType",
                                            "void * pNext",
                                            "StdVideoDecodeH264PictureInfo * pStdPictureInfo",
                                            "uint32_t  slicesCount",
                                            "uint32_t * pSlicesDataOffsets"]

  VkVideoDecodeH264ProfileEXT = struct ["VkStructureType  sType",
                                        "void * pNext",
                                        "StdVideoH264ProfileIdc  stdProfileIdc",
                                        "VkVideoDecodeH264PictureLayoutFlagsEXT  pictureLayout"]

  VkVideoDecodeH264SessionCreateInfoEXT = struct ["VkStructureType  sType",
                                                  "void * pNext",
                                                  "VkVideoDecodeH264CreateFlagsEXT  flags",
                                                  "VkExtensionProperties * pStdExtensionVersion"]

  VkVideoDecodeH264SessionParametersAddInfoEXT = struct ["VkStructureType  sType",
                                                         "void * pNext",
                                                         "uint32_t  spsStdCount",
                                                         "StdVideoH264SequenceParameterSet * pSpsStd",
                                                         "uint32_t  ppsStdCount",
                                                         "StdVideoH264PictureParameterSet * pPpsStd"]

  VkVideoDecodeH264SessionParametersCreateInfoEXT = struct ["VkStructureType  sType",
                                                            "void * pNext",
                                                            "uint32_t  maxSpsStdCount",
                                                            "uint32_t  maxPpsStdCount",
                                                            "VkVideoDecodeH264SessionParametersAddInfoEXT * pParametersAddInfo"]

  VkVideoDecodeH265CapabilitiesEXT = struct ["VkStructureType  sType",
                                             "void * pNext",
                                             "uint32_t  maxLevel",
                                             { "stdExtensionVersion" => VkExtensionProperties }]

  VkVideoDecodeH265DpbSlotInfoEXT = struct ["VkStructureType  sType",
                                            "void * pNext",
                                            "StdVideoDecodeH265ReferenceInfo * pStdReferenceInfo"]

  VkVideoDecodeH265PictureInfoEXT = struct ["VkStructureType  sType",
                                            "void * pNext",
                                            "StdVideoDecodeH265PictureInfo * pStdPictureInfo",
                                            "uint32_t  slicesCount",
                                            "uint32_t * pSlicesDataOffsets"]

  VkVideoDecodeH265ProfileEXT = struct ["VkStructureType  sType",
                                        "void * pNext",
                                        "StdVideoH265ProfileIdc  stdProfileIdc"]

  VkVideoDecodeH265SessionCreateInfoEXT = struct ["VkStructureType  sType",
                                                  "void * pNext",
                                                  "VkVideoDecodeH265CreateFlagsEXT  flags",
                                                  "VkExtensionProperties * pStdExtensionVersion"]

  VkVideoDecodeH265SessionParametersAddInfoEXT = struct ["VkStructureType  sType",
                                                         "void * pNext",
                                                         "uint32_t  spsStdCount",
                                                         "StdVideoH265SequenceParameterSet * pSpsStd",
                                                         "uint32_t  ppsStdCount",
                                                         "StdVideoH265PictureParameterSet * pPpsStd"]

  VkVideoDecodeH265SessionParametersCreateInfoEXT = struct ["VkStructureType  sType",
                                                            "void * pNext",
                                                            "uint32_t  maxSpsStdCount",
                                                            "uint32_t  maxPpsStdCount",
                                                            "VkVideoDecodeH265SessionParametersAddInfoEXT * pParametersAddInfo"]

  VkVideoDecodeInfoKHR = struct ["VkStructureType  sType",
                                 "void * pNext",
                                 "VkVideoDecodeFlagsKHR  flags",
                                 { "codedOffset" => VkOffset2D },
                                 { "codedExtent" => VkExtent2D },
                                 "VkBuffer  srcBuffer",
                                 "VkDeviceSize  srcBufferOffset",
                                 "VkDeviceSize  srcBufferRange",
                                 { "dstPictureResource" => VkVideoPictureResourceKHR },
                                 "VkVideoReferenceSlotKHR * pSetupReferenceSlot",
                                 "uint32_t  referenceSlotCount",
                                 "VkVideoReferenceSlotKHR * pReferenceSlots"]

  VkVideoEncodeCapabilitiesKHR = struct ["VkStructureType  sType",
                                         "void * pNext",
                                         "VkVideoEncodeCapabilityFlagsKHR  flags",
                                         "VkVideoEncodeRateControlModeFlagsKHR  rateControlModes",
                                         "uint8_t  rateControlLayerCount",
                                         "uint8_t  qualityLevelCount",
                                         { "inputImageDataFillAlignment" => VkExtent2D }]

  VkVideoEncodeH264CapabilitiesEXT = struct ["VkStructureType  sType",
                                             "void * pNext",
                                             "VkVideoEncodeH264CapabilityFlagsEXT  flags",
                                             "VkVideoEncodeH264InputModeFlagsEXT  inputModeFlags",
                                             "VkVideoEncodeH264OutputModeFlagsEXT  outputModeFlags",
                                             "uint8_t  maxPPictureL0ReferenceCount",
                                             "uint8_t  maxBPictureL0ReferenceCount",
                                             "uint8_t  maxL1ReferenceCount",
                                             "VkBool32  motionVectorsOverPicBoundariesFlag",
                                             "uint32_t  maxBytesPerPicDenom",
                                             "uint32_t  maxBitsPerMbDenom",
                                             "uint32_t  log2MaxMvLengthHorizontal",
                                             "uint32_t  log2MaxMvLengthVertical",
                                             { "stdExtensionVersion" => VkExtensionProperties }]

  VkVideoEncodeH264DpbSlotInfoEXT = struct ["VkStructureType  sType",
                                            "void * pNext",
                                            "int8_t  slotIndex",
                                            "StdVideoEncodeH264ReferenceInfo * pStdReferenceInfo"]

  VkVideoEncodeH264EmitPictureParametersEXT = struct ["VkStructureType  sType",
                                                      "void * pNext",
                                                      "uint8_t  spsId",
                                                      "VkBool32  emitSpsEnable",
                                                      "uint32_t  ppsIdEntryCount",
                                                      "uint8_t * ppsIdEntries"]

  VkVideoEncodeH264FrameSizeEXT = struct ["uint32_t  frameISize",
                                          "uint32_t  framePSize",
                                          "uint32_t  frameBSize"]

  VkVideoEncodeH264ReferenceListsEXT = struct ["VkStructureType  sType",
                                               "void * pNext",
                                               "uint8_t  referenceList0EntryCount",
                                               "VkVideoEncodeH264DpbSlotInfoEXT * pReferenceList0Entries",
                                               "uint8_t  referenceList1EntryCount",
                                               "VkVideoEncodeH264DpbSlotInfoEXT * pReferenceList1Entries",
                                               "StdVideoEncodeH264RefMemMgmtCtrlOperations * pMemMgmtCtrlOperations"]
  VkVideoEncodeH264NaluSliceEXT = struct ["VkStructureType  sType",
                                          "void * pNext",
                                          "uint32_t  mbCount",
                                          "VkVideoEncodeH264ReferenceListsEXT * pReferenceFinalLists",
                                          "StdVideoEncodeH264SliceHeader * pSliceHeaderStd"]

  VkVideoEncodeH264ProfileEXT = struct ["VkStructureType  sType",
                                        "void * pNext",
                                        "StdVideoH264ProfileIdc  stdProfileIdc"]

  VkVideoEncodeH264QpEXT = struct ["int32_t  qpI",
                                   "int32_t  qpP",
                                   "int32_t  qpB"]

  VkVideoEncodeH264RateControlInfoEXT = struct ["VkStructureType  sType",
                                                "void * pNext",
                                                "uint32_t  gopFrameCount",
                                                "uint32_t  idrPeriod",
                                                "uint32_t  consecutiveBFrameCount",
                                                "VkVideoEncodeH264RateControlStructureFlagBitsEXT  rateControlStructure",
                                                "uint8_t  temporalLayerCount"]

  VkVideoEncodeH264RateControlLayerInfoEXT = struct ["VkStructureType  sType",
                                                     "void * pNext",
                                                     "uint8_t  temporalLayerId",
                                                     "VkBool32  useInitialRcQp",
                                                     { "initialRcQp" => VkVideoEncodeH264QpEXT },
                                                     "VkBool32  useMinQp",
                                                     { "minQp" => VkVideoEncodeH264QpEXT },
                                                     "VkBool32  useMaxQp",
                                                     { "maxQp" => VkVideoEncodeH264QpEXT },
                                                     "VkBool32  useMaxFrameSize",
                                                     { "maxFrameSize" => VkVideoEncodeH264FrameSizeEXT }]

  VkVideoEncodeH264SessionCreateInfoEXT = struct ["VkStructureType  sType",
                                                  "void * pNext",
                                                  "VkVideoEncodeH264CreateFlagsEXT  flags",
                                                  { "maxPictureSizeInMbs" => VkExtent2D },
                                                  "VkExtensionProperties * pStdExtensionVersion"]

  VkVideoEncodeH264SessionParametersAddInfoEXT = struct ["VkStructureType  sType",
                                                         "void * pNext",
                                                         "uint32_t  spsStdCount",
                                                         "StdVideoH264SequenceParameterSet * pSpsStd",
                                                         "uint32_t  ppsStdCount",
                                                         "StdVideoH264PictureParameterSet * pPpsStd"]

  VkVideoEncodeH264SessionParametersCreateInfoEXT = struct ["VkStructureType  sType",
                                                            "void * pNext",
                                                            "uint32_t  maxSpsStdCount",
                                                            "uint32_t  maxPpsStdCount",
                                                            "VkVideoEncodeH264SessionParametersAddInfoEXT * pParametersAddInfo"]

  VkVideoEncodeH264VclFrameInfoEXT = struct ["VkStructureType  sType",
                                             "void * pNext",
                                             "VkVideoEncodeH264ReferenceListsEXT * pReferenceFinalLists",
                                             "uint32_t  naluSliceEntryCount",
                                             "VkVideoEncodeH264NaluSliceEXT * pNaluSliceEntries",
                                             "StdVideoEncodeH264PictureInfo * pCurrentPictureInfo"]

  VkVideoEncodeH265CapabilitiesEXT = struct ["VkStructureType  sType",
                                             "void * pNext",
                                             "VkVideoEncodeH265CapabilityFlagsEXT  flags",
                                             "VkVideoEncodeH265InputModeFlagsEXT  inputModeFlags",
                                             "VkVideoEncodeH265OutputModeFlagsEXT  outputModeFlags",
                                             "VkVideoEncodeH265CtbSizeFlagsEXT  ctbSizes",
                                             "VkVideoEncodeH265TransformBlockSizeFlagsEXT  transformBlockSizes",
                                             "uint8_t  maxPPictureL0ReferenceCount",
                                             "uint8_t  maxBPictureL0ReferenceCount",
                                             "uint8_t  maxL1ReferenceCount",
                                             "uint8_t  maxSubLayersCount",
                                             "uint8_t  minLog2MinLumaCodingBlockSizeMinus3",
                                             "uint8_t  maxLog2MinLumaCodingBlockSizeMinus3",
                                             "uint8_t  minLog2MinLumaTransformBlockSizeMinus2",
                                             "uint8_t  maxLog2MinLumaTransformBlockSizeMinus2",
                                             "uint8_t  minMaxTransformHierarchyDepthInter",
                                             "uint8_t  maxMaxTransformHierarchyDepthInter",
                                             "uint8_t  minMaxTransformHierarchyDepthIntra",
                                             "uint8_t  maxMaxTransformHierarchyDepthIntra",
                                             "uint8_t  maxDiffCuQpDeltaDepth",
                                             "uint8_t  minMaxNumMergeCand",
                                             "uint8_t  maxMaxNumMergeCand",
                                             { "stdExtensionVersion" => VkExtensionProperties }]

  VkVideoEncodeH265DpbSlotInfoEXT = struct ["VkStructureType  sType",
                                            "void * pNext",
                                            "int8_t  slotIndex",
                                            "StdVideoEncodeH265ReferenceInfo * pStdReferenceInfo"]

  VkVideoEncodeH265EmitPictureParametersEXT = struct ["VkStructureType  sType",
                                                      "void * pNext",
                                                      "uint8_t  vpsId",
                                                      "uint8_t  spsId",
                                                      "VkBool32  emitVpsEnable",
                                                      "VkBool32  emitSpsEnable",
                                                      "uint32_t  ppsIdEntryCount",
                                                      "uint8_t * ppsIdEntries"]

  VkVideoEncodeH265FrameSizeEXT = struct ["uint32_t  frameISize",
                                          "uint32_t  framePSize",
                                          "uint32_t  frameBSize"]

  VkVideoEncodeH265ReferenceListsEXT = struct ["VkStructureType  sType",
                                               "void * pNext",
                                               "uint8_t  referenceList0EntryCount",
                                               "VkVideoEncodeH265DpbSlotInfoEXT * pReferenceList0Entries",
                                               "uint8_t  referenceList1EntryCount",
                                               "VkVideoEncodeH265DpbSlotInfoEXT * pReferenceList1Entries",
                                               "StdVideoEncodeH265ReferenceModifications * pReferenceModifications"]
  VkVideoEncodeH265NaluSliceSegmentEXT = struct ["VkStructureType  sType",
                                                 "void * pNext",
                                                 "uint32_t  ctbCount",
                                                 "VkVideoEncodeH265ReferenceListsEXT * pReferenceFinalLists",
                                                 "StdVideoEncodeH265SliceSegmentHeader * pSliceSegmentHeaderStd"]

  VkVideoEncodeH265ProfileEXT = struct ["VkStructureType  sType",
                                        "void * pNext",
                                        "StdVideoH265ProfileIdc  stdProfileIdc"]

  VkVideoEncodeH265QpEXT = struct ["int32_t  qpI",
                                   "int32_t  qpP",
                                   "int32_t  qpB"]

  VkVideoEncodeH265RateControlInfoEXT = struct ["VkStructureType  sType",
                                                "void * pNext",
                                                "uint32_t  gopFrameCount",
                                                "uint32_t  idrPeriod",
                                                "uint32_t  consecutiveBFrameCount",
                                                "VkVideoEncodeH265RateControlStructureFlagBitsEXT  rateControlStructure",
                                                "uint8_t  subLayerCount"]

  VkVideoEncodeH265RateControlLayerInfoEXT = struct ["VkStructureType  sType",
                                                     "void * pNext",
                                                     "uint8_t  temporalId",
                                                     "VkBool32  useInitialRcQp",
                                                     { "initialRcQp" => VkVideoEncodeH265QpEXT },
                                                     "VkBool32  useMinQp",
                                                     { "minQp" => VkVideoEncodeH265QpEXT },
                                                     "VkBool32  useMaxQp",
                                                     { "maxQp" => VkVideoEncodeH265QpEXT },
                                                     "VkBool32  useMaxFrameSize",
                                                     { "maxFrameSize" => VkVideoEncodeH265FrameSizeEXT }]

  VkVideoEncodeH265SessionCreateInfoEXT = struct ["VkStructureType  sType",
                                                  "void * pNext",
                                                  "VkVideoEncodeH265CreateFlagsEXT  flags",
                                                  "VkExtensionProperties * pStdExtensionVersion"]

  VkVideoEncodeH265SessionParametersAddInfoEXT = struct ["VkStructureType  sType",
                                                         "void * pNext",
                                                         "uint32_t  vpsStdCount",
                                                         "StdVideoH265VideoParameterSet * pVpsStd",
                                                         "uint32_t  spsStdCount",
                                                         "StdVideoH265SequenceParameterSet * pSpsStd",
                                                         "uint32_t  ppsStdCount",
                                                         "StdVideoH265PictureParameterSet * pPpsStd"]

  VkVideoEncodeH265SessionParametersCreateInfoEXT = struct ["VkStructureType  sType",
                                                            "void * pNext",
                                                            "uint32_t  maxVpsStdCount",
                                                            "uint32_t  maxSpsStdCount",
                                                            "uint32_t  maxPpsStdCount",
                                                            "VkVideoEncodeH265SessionParametersAddInfoEXT * pParametersAddInfo"]

  VkVideoEncodeH265VclFrameInfoEXT = struct ["VkStructureType  sType",
                                             "void * pNext",
                                             "VkVideoEncodeH265ReferenceListsEXT * pReferenceFinalLists",
                                             "uint32_t  naluSliceSegmentEntryCount",
                                             "VkVideoEncodeH265NaluSliceSegmentEXT * pNaluSliceSegmentEntries",
                                             "StdVideoEncodeH265PictureInfo * pCurrentPictureInfo"]

  VkVideoEncodeInfoKHR = struct ["VkStructureType  sType",
                                 "void * pNext",
                                 "VkVideoEncodeFlagsKHR  flags",
                                 "uint32_t  qualityLevel",
                                 { "codedExtent" => VkExtent2D },
                                 "VkBuffer  dstBitstreamBuffer",
                                 "VkDeviceSize  dstBitstreamBufferOffset",
                                 "VkDeviceSize  dstBitstreamBufferMaxRange",
                                 { "srcPictureResource" => VkVideoPictureResourceKHR },
                                 "VkVideoReferenceSlotKHR * pSetupReferenceSlot",
                                 "uint32_t  referenceSlotCount",
                                 "VkVideoReferenceSlotKHR * pReferenceSlots",
                                 "uint32_t  precedingExternallyEncodedBytes"]

  VkVideoEncodeRateControlLayerInfoKHR = struct ["VkStructureType  sType",
                                                 "void * pNext",
                                                 "uint32_t  averageBitrate",
                                                 "uint32_t  maxBitrate",
                                                 "uint32_t  frameRateNumerator",
                                                 "uint32_t  frameRateDenominator",
                                                 "uint32_t  virtualBufferSizeInMs",
                                                 "uint32_t  initialVirtualBufferSizeInMs"]
  VkVideoEncodeRateControlInfoKHR = struct ["VkStructureType  sType",
                                            "void * pNext",
                                            "VkVideoEncodeRateControlFlagsKHR  flags",
                                            "VkVideoEncodeRateControlModeFlagBitsKHR  rateControlMode",
                                            "uint8_t  layerCount",
                                            "VkVideoEncodeRateControlLayerInfoKHR * pLayerConfigs"]

  VkVideoEndCodingInfoKHR = struct ["VkStructureType  sType",
                                    "void * pNext",
                                    "VkVideoEndCodingFlagsKHR  flags"]

  VkVideoFormatPropertiesKHR = struct ["VkStructureType  sType",
                                       "void * pNext",
                                       "VkFormat  format"]

  VkVideoGetMemoryPropertiesKHR = struct ["VkStructureType  sType",
                                          "void * pNext",
                                          "uint32_t  memoryBindIndex",
                                          "VkMemoryRequirements2 * pMemoryRequirements"]

  VkVideoQueueFamilyProperties2KHR = struct ["VkStructureType  sType",
                                             "void * pNext",
                                             "VkVideoCodecOperationFlagsKHR  videoCodecOperations"]

  VkVideoSessionCreateInfoKHR = struct ["VkStructureType  sType",
                                        "void * pNext",
                                        "uint32_t  queueFamilyIndex",
                                        "VkVideoSessionCreateFlagsKHR  flags",
                                        "VkVideoProfileKHR * pVideoProfile",
                                        "VkFormat  pictureFormat",
                                        { "maxCodedExtent" => VkExtent2D },
                                        "VkFormat  referencePicturesFormat",
                                        "uint32_t  maxReferencePicturesSlotsCount",
                                        "uint32_t  maxReferencePicturesActiveCount"]

  VkVideoSessionParametersCreateInfoKHR = struct ["VkStructureType  sType",
                                                  "void * pNext",
                                                  "VkVideoSessionParametersKHR  videoSessionParametersTemplate",
                                                  "VkVideoSessionKHR  videoSession"]

  VkVideoSessionParametersUpdateInfoKHR = struct ["VkStructureType  sType",
                                                  "void * pNext",
                                                  "uint32_t  updateSequenceCount"]

  VkWaylandSurfaceCreateInfoKHR = struct ["VkStructureType  sType",
                                          "void * pNext",
                                          "VkWaylandSurfaceCreateFlagsKHR  flags",
                                          "wl_display * display",
                                          "wl_surface * surface"]

  VkWin32KeyedMutexAcquireReleaseInfoKHR = struct ["VkStructureType  sType",
                                                   "void * pNext",
                                                   "uint32_t  acquireCount",
                                                   "VkDeviceMemory * pAcquireSyncs",
                                                   "uint64_t * pAcquireKeys",
                                                   "uint32_t * pAcquireTimeouts",
                                                   "uint32_t  releaseCount",
                                                   "VkDeviceMemory * pReleaseSyncs",
                                                   "uint64_t * pReleaseKeys"]

  VkWin32KeyedMutexAcquireReleaseInfoNV = struct ["VkStructureType  sType",
                                                  "void * pNext",
                                                  "uint32_t  acquireCount",
                                                  "VkDeviceMemory * pAcquireSyncs",
                                                  "uint64_t * pAcquireKeys",
                                                  "uint32_t * pAcquireTimeoutMilliseconds",
                                                  "uint32_t  releaseCount",
                                                  "VkDeviceMemory * pReleaseSyncs",
                                                  "uint64_t * pReleaseKeys"]

  VkWin32SurfaceCreateInfoKHR = struct ["VkStructureType  sType",
                                        "void * pNext",
                                        "VkWin32SurfaceCreateFlagsKHR  flags",
                                        "HINSTANCE  hinstance",
                                        "HWND  hwnd"]

  VkWriteDescriptorSet = struct ["VkStructureType  sType",
                                 "void * pNext",
                                 "VkDescriptorSet  dstSet",
                                 "uint32_t  dstBinding",
                                 "uint32_t  dstArrayElement",
                                 "uint32_t  descriptorCount",
                                 "VkDescriptorType  descriptorType",
                                 "VkDescriptorImageInfo * pImageInfo",
                                 "VkDescriptorBufferInfo * pBufferInfo",
                                 "VkBufferView * pTexelBufferView"]

  VkWriteDescriptorSetAccelerationStructureKHR = struct ["VkStructureType  sType",
                                                         "void * pNext",
                                                         "uint32_t  accelerationStructureCount",
                                                         "VkAccelerationStructureKHR * pAccelerationStructures"]

  VkWriteDescriptorSetAccelerationStructureNV = struct ["VkStructureType  sType",
                                                        "void * pNext",
                                                        "uint32_t  accelerationStructureCount",
                                                        "VkAccelerationStructureNV * pAccelerationStructures"]

  VkWriteDescriptorSetInlineUniformBlock = struct ["VkStructureType  sType",
                                                   "void * pNext",
                                                   "uint32_t  dataSize",
                                                   "void * pData"]

  VkWriteDescriptorSetInlineUniformBlockEXT = VkWriteDescriptorSetInlineUniformBlock

  VkXcbSurfaceCreateInfoKHR = struct ["VkStructureType  sType",
                                      "void * pNext",
                                      "VkXcbSurfaceCreateFlagsKHR  flags",
                                      "xcb_connection_t * connection",
                                      "xcb_window_t  window"]

  VkXlibSurfaceCreateInfoKHR = struct ["VkStructureType  sType",
                                       "void * pNext",
                                       "VkXlibSurfaceCreateFlagsKHR  flags",
                                       "Display * dpy",
                                       "Window  window"]

end
