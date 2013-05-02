import cython
cimport world


#cython: boundscheck=False
#cython: wraparound=False
#cython: cdivision=True


cdef class PerlinNoise(object):
    cdef public:
        list perm, weights
        double PERSISTENCE, H
        int OCTAVES
        bint regen_weight

    cdef double fade(self, double t)

    cdef double lerp(self, double t, double a, double b)

    @cython.locals(h=int, u=double, v=double)
    cdef double grad(self, int hash, double x, double y, double z)

    @cython.locals(X=int, Y=int, Z=int, u=double, v=double, w=double,
                   A=int, AA=int, AB=int, B=int, BA=int, BB=int)
    cdef double noise(self, double x, double y, double z)

    @cython.locals(total=double, n=int)
    cpdef double fBm(self, double x, double y, double z)


cdef class TerrainGeneratorBase(object):
    cdef public object seed

    cpdef object generate_sector(self, sector)


cdef class TerrainGenerator(TerrainGeneratorBase):
    cdef public:
        PerlinNoise base_gen
        PerlinNoise ocean_gen
        PerlinNoise river_gen
        PerlinNoise mount_gen
        PerlinNoise hill_gen
        PerlinNoise cave_gen
        object biome_gen

    cpdef object set_seed(self, object seed)

    cpdef object generate_chunk(self, object chunk_x, object chunk_y,
                                object chunk_z)

    cpdef object gen_inner_layer(self, object x, object y, object z, object c)

    cpdef object gen_outer_layer(self, object x, object y, object z,
                                 object first_block, object c,
                                 object biome_type)

    cpdef object lerp(self, object x, object x1, object x2, object v00,
                      object v01)

    cpdef object tri_lerp(self, object x, object y, object z, object v000,
                          object v001, object v010, object v011, object v100,
                          object v101, object v110, object v111, object x1,
                          object x2, object  y1, y2, object z1, object z2)

    @cython.locals(x=int, y=int, z=int)
    cpdef object tri_lerp_d_map(self, object d_map)

    cpdef double _clamp(self, double a)

    cpdef object density(self, object x, object y, object z)

    cpdef object base_terrain(self, object x, object y)

    cpdef object ocean_terrain(self, object x, object y)

    cpdef object rive_terrain(self, object x, object y)

    cpdef object mount_density(self, object x, object y, object z)

    cpdef object hill_density(self, object x, object y, object z)

    cpdef object cave_density(self, object x, object y, object z)


cdef class TerrainGeneratorSimple(TerrainGeneratorBase):
    cdef public:
        object world
        object rand
        object weights
        object noise
        bint skip_over
        double PERSISTENCE
        double H
        int OCTAVES
        int height_range
        int height_base
        int island_shore
        int water_level
        double zoom_level
        tuple lowlevel_ores
        tuple midlevel_ores
        tuple highlevel_ores
        tuple underwater_blocks
        tuple world_type_trees
        tuple world_type_plants
        tuple world_type_grass
        tuple island_type_grass
        tuple leaf_blocks
        set autogenerated_blocks
        int negative_biome_trigger

    cpdef double _clamp(self, double a)

    @cython.locals(y=double, weight=double)
    cpdef int get_height(self, double x, double z)

    @cython.locals(world=object, islandheight=int, skip=bint, bx=int,
                   by=int, bz=int, bytop=int, x=int, z=int, y=int, yy=int)
    cpdef object generate_sector(self, object sector)