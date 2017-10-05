From: Steve McIntyre <steve@einval.com>
Subject: Re: Bug#877735: busybox: m68k build broken due to "-Os" in CFLAGS
Date: Thu, 5 Oct 2017 17:38:46 +0100
Message-ID: <20171005163846.kqzwht6276t3jxa6@tack.einval.com>
References: <150715899716.21351.14956363415364529265.reportbug@stretch64.physik.fu-berlin.de>
 <150715899716.21351.14956363415364529265.reportbug@stretch64.physik.fu-berlin.de>
 <998e4cf2-07bd-cb2d-1c47-c373372ce3fe@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <bounce-debian-68k=debian-68k=m.gmane.org@lists.debian.org>
Content-Disposition: inline
In-Reply-To: <998e4cf2-07bd-cb2d-1c47-c373372ce3fe@physik.fu-berlin.de>
Resent-Message-ID: <XnMYl0_w5yI.A.xVF.ABm1ZB@bendel>
List-URL: <https://lists.debian.org/debian-68k/>
List-Post: <mailto:debian-68k@lists.debian.org>
List-Help: <mailto:debian-68k-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-68k-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-68k-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/20171005163846.kqzwht6276t3jxa6@tack.einval.com
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 877735@bugs.debian.org
Cc: Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

On Thu, Oct 05, 2017 at 09:25:12AM +0200, John Paul Adrian Glaubitz wrote:
>Hi!
>
>On 10/05/2017 01:16 AM, John Paul Adrian Glaubitz wrote:
>> Since busybox is very important to boot the system and get
>> debian-installer working, I would like to ask to have the
>> change from [1] reverted for m68k until we have fixed the
>> potential bug in gcc which most likely mis-compiled busybox.
>
>On second thought, I would actually recommended to revert this change
>for all architectures. Size isn't so much a constraint anymore these
>days, you reduce the binary by about 200k. I don't think this is worth
>the risk of breaking something as fundemantal as busybox.

I'd be more worried about the compiler breakage, to be honest. -Os is
meant to work!
