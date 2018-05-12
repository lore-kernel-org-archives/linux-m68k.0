From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [parted-devel] Atari label false positives
Date: Sun, 13 May 2018 07:22:17 +1200
Message-ID: <fc99627f-ebb7-d556-2f69-72b4f5a557ef@gmail.com>
References: <2d6f5455-963d-b044-a64d-67634df46071@ubuntu.com>
 <35ad9889-bc13-56bd-7831-f7bb3eea2d1e@physik.fu-berlin.de>
 <874bf955-d5bc-5d9c-0f87-445da67f3bdd@ubuntu.com>
 <80a28dd6-ce19-e6ed-fc7a-c5561fecf989@gmail.com>
 <82528a79-31d5-e8c9-08db-253462619197@physik.fu-berlin.de>
 <c1bf0748-f7e0-b109-8c9e-26f8a2c70bf3@gmail.com>
 <fee352b1-4dbc-b02e-65b1-f138e84a6042@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <bounce-debian-68k=debian-68k=m.gmane.org@lists.debian.org>
In-Reply-To: <fee352b1-4dbc-b02e-65b1-f138e84a6042@physik.fu-berlin.de>
Resent-Message-ID: <vWHKNDgfsNB.A._-G.U8z9aB@bendel>
List-URL: <https://lists.debian.org/debian-68k/>
List-Post: <mailto:debian-68k@lists.debian.org>
List-Help: <mailto:debian-68k-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-68k-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-68k-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/fc99627f-ebb7-d556-2f69-72b4f5a557ef@gmail.com
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Phillip Susi <psusi@ubuntu.com>
Cc: Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Parted development <parted-devel@lists.alioth.debian.org>
List-Id: linux-m68k@vger.kernel.org

Hi Adrian,

Am 12.05.2018 um 23:24 schrieb John Paul Adrian Glaubitz:
> On 05/12/2018 10:41 AM, Michael Schmitz wrote:
>>>> Do you have a dump of the root sector (plus additional eventual
>>>> extended
>>>> partition root sector) from these bugs?
>>>
>>> This is a very good point. We should have a look at the probing code in
>>> the kernel because apparently the problem doesn't exist there.
>>
>> It may not exist because the MSDOS partition detection is specific
>> enough to reject Atari partition tables. But still, compare the kernel
>> partition parsers to see what may be missing.
> 
> Which would mean that the kernel probes for DOS partition tables before
> Atari partition tables, wouldn't it?

Yes, it does (as I had stated earlier - block/partitions/checks.c has
only a few rather more specific formats listed before MSDOS. Sorry if
that wasn't clear.).

> 
> Adrian
> 
