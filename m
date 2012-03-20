From: Kautuk Consul <consul.kautuk@gmail.com>
Subject: Re: [PATCH 08/20] m68k/mm/fault.c: Port OOM changes to do_page_fault
Date: Tue, 20 Mar 2012 12:04:53 -0400
Message-ID: <CAFPAmTQFGiF56XLgGHb3Tm15+H2eV=cXU8qDfrHpGabXrsNVNg@mail.gmail.com>
References: <1332249746-2867-1-git-send-email-consul.kautuk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1332249746-2867-1-git-send-email-consul.kautuk@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Kautuk Consul <consul.kautuk@gmail.com>

Hi,

Im sorry there is a defect in this patch.

I am now posting a v2 of this patch.

On Tue, Mar 20, 2012 at 9:22 AM, Kautuk Consul <consul.kautuk@gmail.com=
> wrote:
> Commit d065bd810b6deb67d4897a14bfe21f8eb526ba99
> (mm: retry page fault when blocking on disk transfer) and
> commit 37b23e0525d393d48a7d59f870b3bc061a30ccdb
> (x86,mm: make pagefault killable)
>
> The above commits introduced changes into the x86 pagefault handler
> for making the page fault handler retryable as well as killable.
>
> These changes reduce the mmap_sem hold time, which is crucial
> during OOM killer invocation.
>
> Port these changes to m68k.
>
> Signed-off-by: Kautuk Consul <consul.kautuk@gmail.com>
> ---
> =A0arch/m68k/mm/fault.c | =A0 31 ++++++++++++++++++++++++++-----
> =A01 files changed, 26 insertions(+), 5 deletions(-)
>
> diff --git a/arch/m68k/mm/fault.c b/arch/m68k/mm/fault.c
> index 2db6099..27879bd 100644
> --- a/arch/m68k/mm/fault.c
> +++ b/arch/m68k/mm/fault.c
> @@ -74,6 +74,7 @@ int do_page_fault(struct pt_regs *regs, unsigned lo=
ng address,
> =A0 =A0 =A0 =A0struct mm_struct *mm =3D current->mm;
> =A0 =A0 =A0 =A0struct vm_area_struct * vma;
> =A0 =A0 =A0 =A0int write, fault;
> + =A0 =A0 =A0 unsigned int flags =3D FAULT_FLAG_ALLOW_RETRY | FAULT_F=
LAG_KILLABLE;
>
> =A0#ifdef DEBUG
> =A0 =A0 =A0 =A0printk ("do page fault:\nregs->sr=3D%#x, regs->pc=3D%#=
lx, address=3D%#lx, %ld, %p\n",
> @@ -88,6 +89,7 @@ int do_page_fault(struct pt_regs *regs, unsigned lo=
ng address,
> =A0 =A0 =A0 =A0if (in_atomic() || !mm)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto no_context;
>
> +retry:
> =A0 =A0 =A0 =A0down_read(&mm->mmap_sem);
>
> =A0 =A0 =A0 =A0vma =3D find_vma(mm, address);
> @@ -126,6 +128,7 @@ good_area:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!(vma->vm_flags & =
VM_WRITE))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto a=
cc_err;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0write++;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 flags |=3D FAULT_FLAG_W=
RITE;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0case 1: =A0 =A0 =A0 =A0 /* read, prese=
nt */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto acc_err;
> @@ -140,10 +143,14 @@ good_area:
> =A0 =A0 =A0 =A0 * the fault.
> =A0 =A0 =A0 =A0 */
>
> - =A0 =A0 =A0 fault =3D handle_mm_fault(mm, vma, address, write ? FAU=
LT_FLAG_WRITE : 0);
> + =A0 =A0 =A0 fault =3D handle_mm_fault(mm, vma, address, flags);
> =A0#ifdef DEBUG
> =A0 =A0 =A0 =A0printk("handle_mm_fault returns %d\n",fault);
> =A0#endif
> +
> + =A0 =A0 =A0 if ((fault & VM_FAULT_RETRY) && fatal_signal_pending(cu=
rrent))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;

Incorrect. This function returns an int.

> +
> =A0 =A0 =A0 =A0if (unlikely(fault & VM_FAULT_ERROR)) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (fault & VM_FAULT_OOM)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto out_of_memory;
> @@ -151,10 +158,24 @@ good_area:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto bus_err;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0BUG();
> =A0 =A0 =A0 =A0}
> - =A0 =A0 =A0 if (fault & VM_FAULT_MAJOR)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 current->maj_flt++;
> - =A0 =A0 =A0 else
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 current->min_flt++;
> +
> + =A0 =A0 =A0 if (flags & FAULT_FLAG_ALLOW_RETRY) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (fault & VM_FAULT_MAJOR)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 current->maj_flt++;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 current->min_flt++;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (fault & VM_FAULT_RETRY) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 flags &=3D ~FAULT_FLAG_=
ALLOW_RETRY;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* No need to up_read=
(&mm->mmap_sem) as we would
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* have already relea=
sed it in __lock_page_or_retry
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* in mm/filemap.c.
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto retry;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 }
>
> =A0 =A0 =A0 =A0up_read(&mm->mmap_sem);
> =A0 =A0 =A0 =A0return 0;
> --
> 1.7.5.4
>
