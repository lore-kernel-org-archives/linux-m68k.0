From: Christoph Hellwig <hch@lst.de>
Subject: [fengguang.wu@intel.com: [pnfs:xfs-nfsd-clone]
	57b7d25bf4c57ebe0fbd2d8c5b37edf503175e1f BUILD DONE]
Date: Thu, 18 Feb 2016 14:32:40 +0100
Message-ID: <20160218133240.GA5228@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: xfs@oss.sgi.com
Cc: "Darrick J. Wong" <darrick.wong@oracle.com>, linux-m68k@lists.linux-m68k.org

Looks like the structure size checker found it's first victim on m68k,
which doesn't seem to pad to 4 byte boundaries.  I don't think it actua=
lly
matters in practice as we'll always the hacky appromiation of a variabl=
e
sized array behind it.  I guess we should move this to a modern C99 VLA
and mark it as __packed?

----- Forwarded message from kbuild test robot <fengguang.wu@intel.com>=
 -----

Date: Thu, 18 Feb 2016 21:26:23 +0800
=46rom: kbuild test robot <fengguang.wu@intel.com>
Subject: [pnfs:xfs-nfsd-clone] 57b7d25bf4c57ebe0fbd2d8c5b37edf503175e1f
	BUILD DONE
To: Christoph Hellwig <hch@lst.de>

git://git.infradead.org/users/hch/pnfs.git  xfs-nfsd-clone
57b7d25bf4c57ebe0fbd2d8c5b37edf503175e1f  nfs4: fix stateid handling fo=
r the NFS v4.2 operations

fs/xfs/xfs_ondisk.h:22:2: note: in expansion of macro 'BUILD_BUG_ON_MSG=
'
fs/xfs/xfs_ondisk.h:74:2: note: in expansion of macro 'XFS_CHECK_STRUCT=
_SIZE'
include/linux/compiler.h:502:38: error: call to '__compiletime_assert_7=
4' declared with attribute error: XFS: sizeof(xfs_attr_leaf_name_remote=
_t) is wrong, expected 12

Error ids grouped by kconfigs:

recent_errors
=E2=94=9C=E2=94=80=E2=94=80 m68k-multi_defconfig
=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 fs-xfs-xfs_ondisk.h:n=
ote:in-expansion-of-macro-BUILD_BUG_ON_MSG
=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 fs-xfs-xfs_ondisk.h:n=
ote:in-expansion-of-macro-XFS_CHECK_STRUCT_SIZE
=E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 include-linux-compile=
r.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-erro=
r:XFS:sizeof(xfs_attr_leaf_name_remote_t)-is-wrong-expected
=E2=94=94=E2=94=80=E2=94=80 m68k-sun3_defconfig
    =E2=94=9C=E2=94=80=E2=94=80 fs-xfs-xfs_ondisk.h:note:in-expansion-o=
f-macro-BUILD_BUG_ON_MSG
    =E2=94=9C=E2=94=80=E2=94=80 fs-xfs-xfs_ondisk.h:note:in-expansion-o=
f-macro-XFS_CHECK_STRUCT_SIZE
    =E2=94=94=E2=94=80=E2=94=80 include-linux-compiler.h:error:call-to-=
__compiletime_assert_NNN-declared-with-attribute-error:XFS:sizeof(xfs_a=
ttr_leaf_name_remote_t)-is-wrong-expected

elapsed time: 66m

configs tested: 111

alpha                               defconfig
parisc                            allnoconfig
parisc                        c3000_defconfig
parisc                              defconfig
arm                          badge4_defconfig
arm                        cerfcube_defconfig
powerpc               mpc834x_itxgp_defconfig
i386                     randconfig-a0-201607
x86_64                             acpi-redef
x86_64                           allyesdebian
x86_64                                nfsroot
blackfin                BF526-EZBRD_defconfig
blackfin                BF533-EZKIT_defconfig
blackfin            BF561-EZKIT-SMP_defconfig
blackfin                  TCM-BF537_defconfig
cris                 etrax-100lx_v2_defconfig
sh                                allnoconfig
sh                          rsk7269_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                            titan_defconfig
x86_64                           allmodconfig
arm                               allnoconfig
arm                         at91_dt_defconfig
arm                           efm32_defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                        multi_v7_defconfig
arm                        shmobile_defconfig
arm                           sunxi_defconfig
powerpc                           allnoconfig
powerpc                             defconfig
powerpc                       ppc64_defconfig
m32r                       m32104ut_defconfig
m32r                     mappi3.smp_defconfig
m32r                         opsput_defconfig
m32r                           usrv_defconfig
xtensa                       common_defconfig
xtensa                          iss_defconfig
parisc                         b180_defconfig
arm                         ebsa110_defconfig
arm                           h3600_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                      walnut_defconfig
x86_64                 randconfig-x012-201607
x86_64                 randconfig-x014-201607
x86_64                 randconfig-x017-201607
x86_64                 randconfig-x011-201607
x86_64                 randconfig-x013-201607
x86_64                 randconfig-x019-201607
x86_64                 randconfig-x015-201607
x86_64                 randconfig-x010-201607
x86_64                 randconfig-x016-201607
x86_64                 randconfig-x018-201607
i386                             alldefconfig
i386                              allnoconfig
i386                                defconfig
i386                     randconfig-s0-201607
i386                     randconfig-s1-201607
avr32                      atngw100_defconfig
avr32                     atstk1006_defconfig
frv                                 defconfig
mn10300                     asb2364_defconfig
openrisc                    or1ksim_defconfig
tile                         tilegx_defconfig
um                             i386_defconfig
um                           x86_64_defconfig
i386                               tinyconfig
x86_64                   randconfig-i0-201607
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
i386                     randconfig-i0-201607
i386                     randconfig-i1-201607
sparc                               defconfig
sparc64                           allnoconfig
sparc64                             defconfig
x86_64                                    lkp
x86_64                                   rhel
x86_64         rhel+CONFIG_DEBUG_INFO_REDUCED
i386                     randconfig-n0-201607
ia64                             alldefconfig
ia64                              allnoconfig
ia64                                defconfig
m68k                       m5475evb_defconfig
m68k                          multi_defconfig
m68k                           sun3_defconfig
x86_64                 randconfig-x004-201607
x86_64                 randconfig-x002-201607
x86_64                 randconfig-x000-201607
x86_64                 randconfig-x009-201607
x86_64                 randconfig-x006-201607
x86_64                 randconfig-x003-201607
x86_64                 randconfig-x005-201607
x86_64                 randconfig-x001-201607
x86_64                 randconfig-x007-201607
x86_64                 randconfig-x008-201607
i386                     randconfig-r0-201607
i386                             allmodconfig
i386                   randconfig-x001-201607
i386                   randconfig-x007-201607
i386                   randconfig-x004-201607
i386                   randconfig-x002-201607
i386                   randconfig-x008-201607
i386                   randconfig-x003-201607
i386                   randconfig-x006-201607
i386                   randconfig-x005-201607
i386                   randconfig-x009-201607
i386                   randconfig-x000-201607
mips                              allnoconfig
mips                      fuloong2e_defconfig
mips                                   jz4740
mips                                     txx9

Thanks,
=46engguang

----- End forwarded message -----
