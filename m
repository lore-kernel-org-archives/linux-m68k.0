From: Steve McIntyre <steve@einval.com>
Subject: Re: Bug#877735: busybox: m68k build broken due to "-Os" in CFLAGS
Date: Thu, 5 Oct 2017 17:40:54 +0100
Message-ID: <20171005164054.k3tln4hduzmaw4tb@tack.einval.com>
References: <150715899716.21351.14956363415364529265.reportbug@stretch64.physik.fu-berlin.de>
 <998e4cf2-07bd-cb2d-1c47-c373372ce3fe@physik.fu-berlin.de>
 <CAEQ9gEmFPeibJUANPFbkTJfjyv6hLOG7Wr=ijyfrVSfRkKPEtw@mail.gmail.com>
 <150715899716.21351.14956363415364529265.reportbug@stretch64.physik.fu-berlin.de>
 <fb548f7a-eb98-949b-296c-fd031d8afa5f@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <bounce-debian-68k=debian-68k=m.gmane.org@lists.debian.org>
Content-Disposition: inline
In-Reply-To: <fb548f7a-eb98-949b-296c-fd031d8afa5f@physik.fu-berlin.de>
Resent-Message-ID: <gFbwaiPQB8O.A.5nF.4Cm1ZB@bendel>
List-URL: <https://lists.debian.org/debian-68k/>
List-Post: <mailto:debian-68k@lists.debian.org>
List-Help: <mailto:debian-68k-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-68k-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-68k-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/20171005164054.k3tln4hduzmaw4tb@tack.einval.com
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 877735@bugs.debian.org
Cc: Roger Shimizu <rogershimizu@gmail.com>, Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

On Thu, Oct 05, 2017 at 06:12:46PM +0200, John Paul Adrian Glaubitz wrote:
>On 10/05/2017 05:55 PM, Roger Shimizu wrote:
>> > On second thought, I would actually recommended to revert this change
>> > for all architectures. Size isn't so much a constraint anymore these
>> > days, you reduce the binary by about 200k. I don't think this is worth
>> > the risk of breaking something as fundemantal as busybox.
>> 
>> Please exclude armel, which has size limitation on initrd of d-i [0].
>Hmm, ok. Is that currently actually a concern? If I'm seeing that correctly,
>the "-Os" here only saved us around 200k. Does that already make a difference
>on armel?

Massively so, yes. Lots of the armel platforms that people care about
have very limited space for kernel and initramfs.
