From: John Paul Adrian Glaubitz <glaubitz-1Olz3AKvcsuAKZTfuerNgRvVK+yQ3ZXh@public.gmane.org>
Subject: Re: Atari label false positives
Date: Fri, 11 May 2018 18:10:37 +0200
Message-ID: <461cde4a-4cc2-8dce-538d-2c2af21e5ba3@physik.fu-berlin.de>
References: <2d6f5455-963d-b044-a64d-67634df46071@ubuntu.com>
 <35ad9889-bc13-56bd-7831-f7bb3eea2d1e@physik.fu-berlin.de>
 <874bf955-d5bc-5d9c-0f87-445da67f3bdd@ubuntu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <parted-devel-bounces+gcgpd-parted-devel=m.gmane.org-wVTzQnVv9Y8Rm1jG9FmulZdwIE86Xf0q@public.gmane.org>
In-Reply-To: <874bf955-d5bc-5d9c-0f87-445da67f3bdd-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
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
To: Phillip Susi <psusi-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
Cc: Parted development <parted-devel-XbBxUvOt3X2LieD7tvxI8l/i77bcL1HB@public.gmane.org>, Linux/m68k <linux-m68k-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Debian m68k <debian-68k-0aAXYlwwYIJuHlm7Suoebg@public.gmane.org>
List-Id: linux-m68k@vger.kernel.org

On 05/11/2018 05:56 PM, Phillip Susi wrote:
> On 5/11/2018 11:29 AM, John Paul Adrian Glaubitz wrote:
>> Thanks for digging this up. I wasn't aware of this particular issue before
>> and I agree, this needs to be addressed. I hope that I didn't cause too
>> many DOS partitions to be misdetected. Sorry for the inconvenience if I
>> did. The Atari partition table code has been working great for
>> Debian/m68k so
>> far though.
> 
> I have seen at least one or two reports of Ubuntu users getting false
> positives, and then I saw the bug report on the upstream parted bug
> tracker the other day where someone claimed to have found a logical
> error that caused atari_probe to return true when it shouldn't.  I
> finally realized it was not an error ( at least I think not ).

According to the documentation, p.43 [1], I think offset $01 should always
contain either "GEM", "BGM" or "XGM". They don't seem to be optional.

I guess adding those to atari_probe() should help improve the detection
quite a bit. But I would have to test that first.

> I think I will at least move atari to be probed after all other labels
> have failed.

This sounds like a reasonable thing to do until I have worked out
a patch to improve atari_probe().

Adrian

> [1] https://people.debian.org/~glaubitz/Atari_HD_File_Sytem_Reference_Guide.pdf

-- 
  .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org
`. `'   Freie Universitaet Berlin - glaubitz-1Olz3AKvcsuAKZTfuerNgRvVK+yQ3ZXh@public.gmane.org
   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
