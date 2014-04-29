From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: TASK_SIZE for !MMU
Date: Tue, 29 Apr 2014 12:00:28 +0200
Message-ID: <20140429100028.GH28564@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Rabin Vincent <rabin@rab.in>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel@lists.infradead.org
Cc: David Howells <dhowells@redhat.com>, uclinux-dist-devel@blackfin.uclinux.org, linux-m68k@lists.linux-m68k.org, linux-c6x-dev@linux-c6x.org, linux-m32r@ml.linux-m32r.org, microblaze-uclinux@itee.uq.edu.au, linux-xtensa@linux-xtensa.org, kernel@pengutronix.de

Hello,

I grepped through the kernel (v3.15-rc1) for usages of TASK_SIZE to
check if/how it is used on !MMU ARM machines. Most open questions also
affect the other !MMU platforms, so I put the blackfin, c6x, frv and
m32r, m68k, microblaze and xtensa lists on Cc:. (Did I miss a platform
that cares for !MMU ?)

Most occurences are fine, see the list at the end of this mail. However
some are not or are unclear to me. Here is the complete list[1] apart f=
rom
the definition of TASK_SIZE for !MMU in arch/arm/include/asm/memory.h:

 - Probably this should be explict s/TASK_SIZE/CONFIG_DRAM_SIZE/. This
   is generic code however while CONFIG_DRAM_SIZE is ARM only.
        mm/nommu.c:     if (!rlen || rlen > TASK_SIZE)

 - The issue the patch by Rabin is addressing (Subject: [PATCH] ARM: fi=
x
   string functions on !MMU), alternatively make TASK_SIZE ~0UL.
        arch/arm/include/asm/uaccess.h:#define user_addr_max() \
        arch/arm/include/asm/uaccess.h: (segment_eq(get_fs(), USER_DS) =
? TASK_SIZE : ~0UL)

 - probably bearable if broken:
        drivers/misc/lkdtm.c:           if (user_addr >=3D TASK_SIZE) {
        lib/test_user_copy.c:   user_addr =3D vm_mmap(...)
        lib/test_user_copy.c:   if (user_addr >=3D (unsigned long)(TASK=
_SIZE)) {
        lib/test_user_copy.c:           pr_warn("Failed to allocate use=
r memory\n");
        lib/test_user_copy.c:           return -ENOMEM;

 - unclear to me:
        fs/exec.c:      current->mm->task_size =3D TASK_SIZE;
   - depends on PERF_EVENTS
        kernel/events/core.c:   if (!addr || addr >=3D TASK_SIZE)
        kernel/events/core.c:   return TASK_SIZE - addr;
        kernel/events/uprobes.c:                area->vaddr =3D get_unm=
apped_area(NULL, TASK_SIZE - PAGE_SIZE,
   - depends on (PERF_EVENTS && (CPU_V6 || CPU_V6K || CPU_V7)):
        arch/arm/kernel/hw_breakpoint.c:        return (va >=3D TASK_SI=
ZE) && ((va + len - 1) >=3D TASK_SIZE);
   - seems to cope with big TASK_SIZE
        fs/namespace.c:        size =3D TASK_SIZE - (unsigned long)data=
;
        fs/namespace.c:        if (size > PAGE_SIZE)
        fs/namespace.c:                size =3D PAGE_SIZE;
   - depends on PLAT_S5P || ARCH_EXYNOS, this looks wrong
        drivers/media/platform/s5p-mfc/s5p_mfc_common.h:#define DST_QUE=
UE_OFF_BASE      (TASK_SIZE / 2)
   - used for prctl(PR_SET_MM, ...)
        kernel/sys.c:   if (addr >=3D TASK_SIZE || addr < mmap_min_addr=
)

Any help to judge if these are OK is appreciated (even from Will :-)

I think it would be OK to define TASK_SIZE to 0xffffffff for !MMU.
blackfin, frv and m68k also do this. c6x does define it to 0xFFFFF000 t=
o
leave space for error codes.

Thoughts?

Best regards
Uwe

[1] complete as in "skip everything below arch/ but arch/arm" :-)

=3D=3D=3D=3D=3D=3D=3D These occurences are fine =3D=3D=3D=3D=3D=3D=3D
mmu-only:
        arch/arm/include/asm/memory.h: * TASK_SIZE - the maximum size o=
f a user space task.
        arch/arm/include/asm/memory.h:#define TASK_SIZE         (UL(CON=
=46IG_PAGE_OFFSET) - UL(SZ_16M))
        arch/arm/include/asm/memory.h:#define TASK_UNMAPPED_BASE       =
 ALIGN(TASK_SIZE / 3, SZ_16M)
        arch/arm/include/asm/memory.h:#define TASK_SIZE_26             =
 (UL(1) << 26)
        arch/arm/include/asm/memory.h: * The module space lives between=
 the addresses given by TASK_SIZE
        arch/arm/include/asm/memory.h:#if TASK_SIZE > MODULES_VADDR
        arch/arm/include/asm/pgtable-2level.h:#define USER_PTRS_PER_PGD=
 (TASK_SIZE / PGDIR_SIZE)
        arch/arm/include/asm/pgtable-3level.h:  BUG_ON(addr >=3D TASK_S=
IZE);
        arch/arm/include/asm/pgtable.h: * Use TASK_SIZE as the ceiling =
argument for free_pgtables() and
        arch/arm/include/asm/pgtable.h:#define USER_PGTABLES_CEILING   =
 TASK_SIZE
        arch/arm/include/asm/pgtable.h: if (addr < TASK_SIZE && pte_val=
id_user(pteval)) {
        arch/arm/include/asm/tlb.h:             tlb->range_start =3D TA=
SK_SIZE;
        arch/arm/include/asm/tlb.h:             tlb->range_start =3D TA=
SK_SIZE;
        arch/arm/kernel/entry-armv.S:   cmp     r4, #TASK_SIZE
        arch/arm/mm/fault.c:    if (addr < TASK_SIZE)
        arch/arm/mm/init.c:     BUILD_BUG_ON(TASK_SIZE                 =
         > MODULES_VADDR);
        arch/arm/mm/init.c:     BUG_ON(TASK_SIZE                       =
         > MODULES_VADDR);
        arch/arm/mm/mmap.c:#define MAX_GAP ((TASK_SIZE)/6*5)
        arch/arm/mm/mmap.c:     return PAGE_ALIGN(TASK_SIZE - gap - rnd=
);
        arch/arm/mm/mmap.c:     if (len > TASK_SIZE)
        arch/arm/mm/mmap.c:             if (TASK_SIZE - len >=3D addr &=
&
        arch/arm/mm/mmap.c:     info.high_limit =3D TASK_SIZE;
        arch/arm/mm/mmap.c:     if (len > TASK_SIZE)
        arch/arm/mm/mmap.c:             if (TASK_SIZE - len >=3D addr &=
&
        arch/arm/mm/mmap.c:             info.high_limit =3D TASK_SIZE;
        arch/arm/mm/mmu.c:      if (md->virtual !=3D vectors_base() && =
md->virtual < TASK_SIZE) {
        arch/arm/include/asm/uaccess.h:#define USER_DS          TASK_SI=
ZE
        mm/memory.c:                    if (pg > TASK_SIZE)
        mm/mlock.c:             mm_populate(0, TASK_SIZE);
        mm/mmap.c:      if (len > TASK_SIZE - mmap_min_addr)
        mm/mmap.c:              if (TASK_SIZE - len >=3D addr && addr >=
=3D mmap_min_addr &&
        mm/mmap.c:      info.high_limit =3D TASK_SIZE;
        mm/mmap.c:      if (len > TASK_SIZE - mmap_min_addr)
        mm/mmap.c:              if (TASK_SIZE - len >=3D addr && addr >=
=3D mmap_min_addr &&
        mm/mmap.c:              info.high_limit =3D TASK_SIZE;
        mm/mmap.c:      if (len > TASK_SIZE)
        mm/mmap.c:      if (addr > TASK_SIZE - len)
        mm/mmap.c:      if ((start & ~PAGE_MASK) || start > TASK_SIZE |=
| len > TASK_SIZE
        mm/mremap.c:    if (new_len > TASK_SIZE || new_addr > TASK_SIZE=
 - new_len)

enabled by CONFIG_NUMA, unavailable on ARM:
        mm/mempolicy.c:         pvma.vm_end =3D TASK_SIZE;        /* po=
licy covers entire

Only used in fs/exec.c in #ifdef CONFIG_MMU:
        arch/arm/include/asm/processor.h:#define STACK_TOP_MAX  TASK_SI=
ZE

Used in:
 - fs/binfmt_aout.c (HAVE_AOUT=3Dn on ARM)
 - fs/binfmt_elf.c (depends on MMU)
 - fs/binfmt_som.c (BINFMT_SOM depends on PARISC && HPUX)
 - fs/exec.c (#ifdef CONFIG_MMU)
        arch/arm/include/asm/processor.h:#define STACK_TOP       ((curr=
ent->personality & ADDR_LIMIT_32BIT) ? \
        arch/arm/include/asm/processor.h:                        TASK_S=
IZE : TASK_SIZE_26)

Only used in fs/{,compat_}binfmt_elf.c, depends on MMU
        arch/arm/include/asm/elf.h:#define ELF_ET_DYN_BASE      (2 * TA=
SK_SIZE / 3)

fs/binfmt_aout.c (HAVE_AOUT=3Dn on ARM)
        fs/binfmt_aout.c:#define BAD_ADDR(x)    ((unsigned long)(x) >=3D=
 TASK_SIZE)
fs/binfmt_elf.c (depends on MMU)
        fs/binfmt_elf.c:#define BAD_ADDR(x) ((unsigned long)(x) >=3D TA=
SK_SIZE)
        fs/binfmt_elf.c:                            eppnt->p_memsz > TA=
SK_SIZE ||
        fs/binfmt_elf.c:                            TASK_SIZE - eppnt->=
p_memsz < k) {
        fs/binfmt_elf.c:                    elf_ppnt->p_memsz > TASK_SI=
ZE ||
        fs/binfmt_elf.c:                    TASK_SIZE - elf_ppnt->p_mem=
sz < k) {

HUGETLBFS depends on !ARM || ARM_LPAE || BROKEN, LPAE depends on MMU
        fs/hugetlbfs/inode.c:   if (len > TASK_SIZE)
        fs/hugetlbfs/inode.c:           if (TASK_SIZE - len >=3D addr &=
&
        fs/hugetlbfs/inode.c:   info.high_limit =3D TASK_SIZE;

USER_DS is defined in arch/arm/include/asm/uaccess.h:
        include/asm-generic/uaccess.h:#ifndef USER_DS
        include/asm-generic/uaccess.h:#define USER_DS           MAKE_MM=
_SEG(TASK_SIZE -
        include/asm-generic/uaccess.h:#endif

Only used in fs/proc/task_mmu.c, depends on CONFIG_MMU
        include/linux/sched.h:#define TASK_SIZE_OF(tsk) TASK_SIZE

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
