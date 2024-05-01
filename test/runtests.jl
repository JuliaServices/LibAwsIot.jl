using Test, Aqua, LibAwsIot, LibAwsCommon

@testset "LibAwsIot" begin
    @testset "aqua" begin
        Aqua.test_all(LibAwsIot, ambiguities=false)
        Aqua.test_ambiguities(LibAwsIot)
    end
    @testset "basic usage to test the library loads" begin
        alloc = aws_default_allocator() # important! this shouldn't need to be qualified! if we generate a definition for it in LibAwsIot that is a bug.
        aws_iotdevice_library_init(alloc)
    end
end
