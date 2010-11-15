From: Jens Axboe <jaxboe@fusionio.com>
Subject: Re: [PATCH] fix amiga and atari floppy driver compile warning
Date: Mon, 15 Nov 2010 19:33:21 +0100
Message-ID: <4CE17CF1.3010009@fusionio.com>
References: <20101028184223.GG30148@redhat.com> <20101115152709.GF30792@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mx2.fusionio.com ([64.244.102.31]:33597 "EHLO mx2.fusionio.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757108Ab0KOSd1 (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Mon, 15 Nov 2010 13:33:27 -0500
In-Reply-To: <20101115152709.GF30792@redhat.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Vivek Goyal <vgoyal@redhat.com>
Cc: linux kernel mailing list <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, "linux-m68k@vger.kernel.org" <linux-m68k@vger.kernel.org>, "hch@lst.de" <hch@lst.de>

On 2010-11-15 16:27, Vivek Goyal wrote:
> On Thu, Oct 28, 2010 at 02:42:23PM -0400, Vivek Goyal wrote:
>> Geert, my crosstool don't produce warning below. I guess this has to=
 do
>> something with compiler version.
>>
>> - Geert noticed following warning during compilation.
>>
>>   drivers/block/amiflop.c:1344: warning: =E2=80=98rq=E2=80=99 may be=
 used uninitialized in
>>   this function
>>   drivers/block/ataflop.c:1402: warning: =E2=80=98rq=E2=80=99 may be=
 used uninitialized in
>>   this function
>>
>> - Initialize rq to NULL to fix the warning. If we can't find a suita=
ble request
>>   to dispatch, this function should return NULL instead of a possibl=
y garbage
>>   pointer.
>>
>> - Cross compile tested only. Don't have hardware to test it.
>>
>> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
>=20
> Hi Jens,
>=20
> Do you have any concerns about this patch? If not, can you please app=
ly
> it.

No, it's straight forward just got missed in travel. Applied, thanks.

--=20
Jens Axboe
