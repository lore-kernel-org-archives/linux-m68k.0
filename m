From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] m68k: Use generic strncpy_from_user(), strlen_user(),
 and strnlen_user()
Date: Fri, 8 Jun 2012 14:14:00 +1000
Message-ID: <4FD17C08.8030203__20344.6895619438$1339128944$gmane$org@snapgear.com>
References: <1338327216-15309-1-git-send-email-geert@linux-m68k.org> <20120530102226.GA28628@frolo.macqel> <CAMuHMdV5GVZR1BvGD3EncDFfPt=Bt9ndkKE8Mp7euE9KoSaGNQ@mail.gmail.com> <20120530140444.GA10543@frolo.macqel> <CAMuHMdW29QYN6XpBb9F3GGoJ-9frrD-00Wx=FchT9ALqW1LcPg@mail.gmail.com> <4FCEF956.9090603@snapgear.com> <CAMuHMdWg6W4uOm3N-etXJud5Lw-vBkstQ2h7HK=6i+sCLgeksQ@mail.gmail.com> <4FD08C1B.1090107@snapgear.com> <m2bokvw9f1.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <m2bokvw9f1.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Philippe De Muyter <phdm@macqel.be>, Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

On 07/06/12 23:14, Andreas Schwab wrote:
> Greg Ungerer<gerg@snapgear.com>  writes:
>
>> This strikes me as odd. Maybe this has been wrong all along. I need
>> to check further but in a little testing I did today I think it may
>> well be that all ColdFire support unaligned reads and writes.
>
> The CFPRM doesn't indicate otherwise (the address error exception is
> only documented to be raised for a word index addressing mode).

Yeah, I can't find anything that says otherwise in any of the CPU
specific data sheets either. I suspect the internals of unaligned.h
have just been carried from the original non-mmu 68k support to
ColdFire.

Testing on the ColdFires I have at hand here shows unaligned reads
and writes working on all. And that includes testing with a modified
unaligned.h that allows unaligned accesses.

Geert, I'll put a patch together that changes this over. I'll make
that on top of your recent patch series.

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
