From: John Paul Adrian Glaubitz <glaubitz-1Olz3AKvcsuAKZTfuerNgRvVK+yQ3ZXh@public.gmane.org>
Subject: Re: Atari label false positives
Date: Fri, 11 May 2018 17:29:46 +0200
Message-ID: <35ad9889-bc13-56bd-7831-f7bb3eea2d1e@physik.fu-berlin.de>
References: <2d6f5455-963d-b044-a64d-67634df46071@ubuntu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <parted-devel-bounces+gcgpd-parted-devel=m.gmane.org-wVTzQnVv9Y8Rm1jG9FmulZdwIE86Xf0q@public.gmane.org>
In-Reply-To: <2d6f5455-963d-b044-a64d-67634df46071-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
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
To: Phil Susi <psusi-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
Cc: Debian m68k <debian-68k-0aAXYlwwYIJuHlm7Suoebg@public.gmane.org>, Linux/m68k <linux-m68k-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Parted development <parted-devel-XbBxUvOt3X2LieD7tvxI8l/i77bcL1HB@public.gmane.org>
List-Id: linux-m68k@vger.kernel.org

Hi Phil!

On 05/11/2018 04:18 PM, Phil Susi wrote:
> It seems that the atari label likes to falsely recognize dos labels as
> atari.  Looking at atari_probe, it doesn't seem like this is very hard
> to do.  All that it needs is one word for the size of the disk to be
> less than the physical size of the disk, two bsl words to be zero or
> less than the disk size, the partition start and length words to fit
> within the disk, and 3 bytes to appear to be ascii characters.  Is there
> any way that this can be beefed up at all?

Thanks for digging this up. I wasn't aware of this particular issue before
and I agree, this needs to be addressed. I hope that I didn't cause too
many DOS partitions to be misdetected. Sorry for the inconvenience if I
did. The Atari partition table code has been working great for Debian/m68k so
far though.

> For instance, the name field.. is it really free form ascii or is there
> a specific set of strings that could be limited to?  Also this XGM and
> ICD parts; are they completely optional, so we can't require one of
> those be detected too?

I don't know by heart, but chapter 9 in this Atari filesystem reference
might help us:

> https://people.debian.org/~glaubitz/Atari_HD_File_Sytem_Reference_Guide.pdf

I have also CC'ed the Linux/m68k and Debian/m68k mailing lists in case some of the
guys there knows the answer faster.

Again, sorry for the inconvenience this may have caused. I will look into
how we can improve atari_probe().

Adrian

-- 
  .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org
`. `'   Freie Universitaet Berlin - glaubitz-1Olz3AKvcsuAKZTfuerNgRvVK+yQ3ZXh@public.gmane.org
   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
