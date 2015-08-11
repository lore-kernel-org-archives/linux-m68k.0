From: Alexander Kuleshov <kuleshovmail@gmail.com>
Subject: Re: [PATCH] m68k/coldfire: use PFN_DOWN macro
Date: Wed, 12 Aug 2015 00:09:54 +0600
Message-ID: <20150811180954.GA12610__9322.49563416026$1439316656$gmane$org@localhost>
References: <1439312221-12688-1-git-send-email-kuleshovmail@gmail.com>
 <CAMuHMdV5bS1W5NkQnezYq_V9x2b1y2yQzgco1VNGzx9y9umapA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdV5bS1W5NkQnezYq_V9x2b1y2yQzgco1VNGzx9y9umapA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Ungerer <gerg@uclinux.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 08-11-15, Geert Uytterhoeven wrote:
> Hi Alexander,
> 
> On Tue, Aug 11, 2015 at 6:57 PM, Alexander Kuleshov
> <kuleshovmail@gmail.com> wrote:
> > Replace ((x) >> PAGE_SHIFT) with the predefined PFN_DOWN macro.
> >
> > Signed-off-by: Alexander Kuleshov <kuleshovmail@gmail.com>
> > ---
> >  arch/m68k/coldfire/m54xx.c | 9 +++++----
> >  1 file changed, 5 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/m68k/coldfire/m54xx.c b/arch/m68k/coldfire/m54xx.c
> > index 075aaab..f7836c6 100644
> > --- a/arch/m68k/coldfire/m54xx.c
> > +++ b/arch/m68k/coldfire/m54xx.c
> > @@ -25,4 +25,5 @@
> >  #include <asm/m54xxgpt.h>
> >  #ifdef CONFIG_MMU
> >  #include <asm/mmu_context.h>
> > +#include <linux/pfn.h>
> >  #endif
> >
> >  /***************************************************************************/
> > @@ -91,1 +92,1 @@ static void __init mcf54xx_bootmem_alloc(void)
> 
> The numbers in the above line don't make sense?
> 

Hello Geert, Are you about `-91,1 +92,1....`? Or what numbers. If you are about
this, sorry for noise. I've checked the patch with the git apply --check and it
will return some errors.

If other things are normal I will resend correct patch.

Thank you.
