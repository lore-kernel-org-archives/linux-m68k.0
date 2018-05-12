From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [parted-devel] Atari label false positives
Date: Sat, 12 May 2018 20:41:06 +1200
Message-ID: <c1bf0748-f7e0-b109-8c9e-26f8a2c70bf3@gmail.com>
References: <2d6f5455-963d-b044-a64d-67634df46071@ubuntu.com>
 <35ad9889-bc13-56bd-7831-f7bb3eea2d1e@physik.fu-berlin.de>
 <874bf955-d5bc-5d9c-0f87-445da67f3bdd@ubuntu.com>
 <80a28dd6-ce19-e6ed-fc7a-c5561fecf989@gmail.com>
 <82528a79-31d5-e8c9-08db-253462619197@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <bounce-debian-68k=debian-68k=m.gmane.org@lists.debian.org>
In-Reply-To: <82528a79-31d5-e8c9-08db-253462619197@physik.fu-berlin.de>
Resent-Message-ID: <qOXDlJn7rHF.A.SVC.7iq9aB@bendel>
List-URL: <https://lists.debian.org/debian-68k/>
List-Post: <mailto:debian-68k@lists.debian.org>
List-Help: <mailto:debian-68k-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-68k-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-68k-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/c1bf0748-f7e0-b109-8c9e-26f8a2c70bf3@gmail.com
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Phillip Susi <psusi@ubuntu.com>
Cc: Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Parted development <parted-devel@lists.alioth.debian.org>
List-Id: linux-m68k@vger.kernel.org

Hi Adrian,

Am 12.05.2018 um 19:59 schrieb John Paul Adrian Glaubitz:
> On 05/12/2018 01:17 AM, Michael Schmitz wrote:
>> The link order in the kernel (atari before msdos) has not been chosen at
>> random. The msdos partition format probe will always succeed on any
>> valid Atari partition table, while Atari format probe should not succeed
>> on plain MSDOS partitions.

I had that the wrong way - link order is not what matters here, the
checks order has msdos before atari in fact.

>>
>> Do the reporters if these bugs have Atari partition format enabled in
>> their kernels? I would expect the same false positives to happen there,
>> if the atari_probe() code is functionally equivalent to the kernel
>> partition probe code.
>> Do you have a dump of the root sector (plus additional eventual extended
>> partition root sector) from these bugs?
> 
> This is a very good point. We should have a look at the probing code in
> the kernel because apparently the problem doesn't exist there.

It may not exist because the MSDOS partition detection is specific
enough to reject Atari partition tables. But still, compare the kernel
partition parsers to see what may be missing.

Cheers,

	Michael

> And, yes, it would be interesting to get a dump of these boot sectors as
> I haven't run into the problem myself and would be very curios why
> the misdetection happens.
> 
> Adrian
> 
