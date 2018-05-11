From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [parted-devel] Atari label false positives
Date: Sat, 12 May 2018 11:17:59 +1200
Message-ID: <80a28dd6-ce19-e6ed-fc7a-c5561fecf989@gmail.com>
References: <2d6f5455-963d-b044-a64d-67634df46071@ubuntu.com>
 <35ad9889-bc13-56bd-7831-f7bb3eea2d1e@physik.fu-berlin.de>
 <874bf955-d5bc-5d9c-0f87-445da67f3bdd@ubuntu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <bounce-debian-68k=debian-68k=m.gmane.org@lists.debian.org>
In-Reply-To: <874bf955-d5bc-5d9c-0f87-445da67f3bdd@ubuntu.com>
Resent-Message-ID: <t6bvJWSaeyP.A.1oD.CTi9aB@bendel>
List-URL: <https://lists.debian.org/debian-68k/>
List-Post: <mailto:debian-68k@lists.debian.org>
List-Help: <mailto:debian-68k-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-68k-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-68k-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/80a28dd6-ce19-e6ed-fc7a-c5561fecf989@gmail.com
To: Phillip Susi <psusi@ubuntu.com>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Parted development <parted-devel@lists.alioth.debian.org>
List-Id: linux-m68k@vger.kernel.org

Hi Phillip,

Am 12.05.2018 um 03:56 schrieb Phillip Susi:
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
> 
> I think I will at least move atari to be probed after all other labels
> have failed.

The link order in the kernel (atari before msdos) has not been chosen at
random. The msdos partition format probe will always succeed on any
valid Atari partition table, while Atari format probe should not succeed
on plain MSDOS partitions.

Do the reporters if these bugs have Atari partition format enabled in
their kernels? I would expect the same false positives to happen there,
if the atari_probe() code is functionally equivalent to the kernel
partition probe code.
Do you have a dump of the root sector (plus additional eventual extended
partition root sector) from these bugs?

Regarding some of your other questions: The presence of extended
partitions is entirely optional (though highly likely). A partition ID
of XGM for one of the primary partitions, and for at least one of the
extended subpartitions (if extended partitions are present) is
distinctive for AHDI extended partition format. Seeing this condition
fulfilled by a MSDOS partition would seem quite unlikely. I run a mix of
AHDI and MSDOS partition format disks on my Atari and have never seen
one misidentified by the kernel.

Presence of the ICD extended partitions block at offset 0x156 of the
device root sector (with only IDs of GEM, BGM, RAW, LNX or SWP expected)
is distinctive for ICD partitions, and even more unlikely to encounter
at random.

Leaves disks without extended partitions prone to misidentifcation.
If you want to make doubly sure there, look for at least one of the
partition IDs commonly used in Atari format partitions (GEM, BGM, RAW,
LNX, SWP), and additionally those identified by Richard for Q40.

If that's still not enough, score both probe results according to the
number of partitions identified, and allow the user to override.

Repurposing disks that had formerly been used on Atari elsewhere should
begin by overwriting the root sector IMO.

Cheers,

	Michael
