From: John Paul Adrian Glaubitz <glaubitz-1Olz3AKvcsuAKZTfuerNgRvVK+yQ3ZXh@public.gmane.org>
Subject: Re: Atari label false positives
Date: Sat, 12 May 2018 09:59:30 +0200
Message-ID: <82528a79-31d5-e8c9-08db-253462619197@physik.fu-berlin.de>
References: <2d6f5455-963d-b044-a64d-67634df46071@ubuntu.com>
 <35ad9889-bc13-56bd-7831-f7bb3eea2d1e@physik.fu-berlin.de>
 <874bf955-d5bc-5d9c-0f87-445da67f3bdd@ubuntu.com>
 <80a28dd6-ce19-e6ed-fc7a-c5561fecf989@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <parted-devel-bounces+gcgpd-parted-devel=m.gmane.org-wVTzQnVv9Y8Rm1jG9FmulZdwIE86Xf0q@public.gmane.org>
In-Reply-To: <80a28dd6-ce19-e6ed-fc7a-c5561fecf989-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://alioth-lists.debian.net/cgi-bin/mailman/options/parted-devel>,
 <mailto:parted-devel-request-wVTzQnVv9Y8Rm1jG9FmulZdwIE86Xf0q@public.gmane.org?subject=unsubscribe>
List-Archive: <http://alioth-lists.debian.net/pipermail/parted-devel/>
List-Post: <mailto:parted-devel-wVTzQnVv9Y8Rm1jG9FmulZdwIE86Xf0q@public.gmane.org>
List-Help: <mailto:parted-devel-request-wVTzQnVv9Y8Rm1jG9FmulZdwIE86Xf0q@public.gmane.org?subject=help>
List-Subscribe: <https://alioth-lists.debian.net/cgi-bin/mailman/listinfo/parted-devel>,
 <mailto:parted-devel-request-wVTzQnVv9Y8Rm1jG9FmulZdwIE86Xf0q@public.gmane.org?subject=subscribe>
Errors-To: parted-devel-bounces+gcgpd-parted-devel=m.gmane.org-wVTzQnVv9Y8Rm1jG9FmulZdwIE86Xf0q@public.gmane.org
Sender: "parted-devel"
 <parted-devel-bounces+gcgpd-parted-devel=m.gmane.org-wVTzQnVv9Y8Rm1jG9FmulZdwIE86Xf0q@public.gmane.org>
To: Michael Schmitz <schmitzmic-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Phillip Susi <psusi-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
Cc: Parted development <parted-devel-XbBxUvOt3X2LieD7tvxI8l/i77bcL1HB@public.gmane.org>, Linux/m68k <linux-m68k-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Debian m68k <debian-68k-0aAXYlwwYIJuHlm7Suoebg@public.gmane.org>
List-Id: linux-m68k@vger.kernel.org

On 05/12/2018 01:17 AM, Michael Schmitz wrote:
> The link order in the kernel (atari before msdos) has not been chosen at
> random. The msdos partition format probe will always succeed on any
> valid Atari partition table, while Atari format probe should not succeed
> on plain MSDOS partitions.
> 
> Do the reporters if these bugs have Atari partition format enabled in
> their kernels? I would expect the same false positives to happen there,
> if the atari_probe() code is functionally equivalent to the kernel
> partition probe code.
> Do you have a dump of the root sector (plus additional eventual extended
> partition root sector) from these bugs?

This is a very good point. We should have a look at the probing code in
the kernel because apparently the problem doesn't exist there.

And, yes, it would be interesting to get a dump of these boot sectors as
I haven't run into the problem myself and would be very curios why
the misdetection happens.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org
`. `'   Freie Universitaet Berlin - glaubitz-1Olz3AKvcsuAKZTfuerNgRvVK+yQ3ZXh@public.gmane.org
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
