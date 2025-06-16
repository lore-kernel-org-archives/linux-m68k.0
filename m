Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DAE7FBAC
	for <linux-m68k@vger.kernel.org>; Mon, 16 Jun 2025 06:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750055603; cv=none; b=k5Yb9FSKhoENfaIFlIhx5XTuzTr1wg3VdXGhXttemMSFIFfwKShEUAeBcm66iwU8yQPK+P+DN2qSs0r4zIgHsKEadfSsJmQYeAOBLlFQYXcBWW9/i9Zitl1Xe+hjIZ6viPQXkccQkkTnc2xrCI20fqnBm7T3lipkBIiC2WO807w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750055603; c=relaxed/simple;
	bh=XhtVgFe033XZjBQcfKppYLhzZ0zNbUzRr0BBC/EdXFo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WzIWLpGgwyHeGVeFnznHXCZ/vyGVsUiYPp8eH0NUJvrcs3gHKlpaxim6BmljIjKEaFybvEzbO7VXgA2piRitVZQ5bQHbMYxYobreZRdZLbEkqtT7QgsOMeipZMpJ/iRZmG14rB/6ycdzgMdL77nqIund7tU2yjjkEwNRbvFdGSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vivier.eu; spf=pass smtp.mailfrom=vivier.eu; arc=none smtp.client-ip=212.227.126.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vivier.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivier.eu
Received: from [192.168.100.1] ([82.64.211.94]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N3KgE-1uqnSn2Duk-00si6p; Mon, 16 Jun 2025 08:33:03 +0200
Message-ID: <479479a8-a315-4687-af2b-4fc0efed7a6b@vivier.eu>
Date: Mon, 16 Jun 2025 08:33:02 +0200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Eero Tamminen <oak@helsinkinet.fi>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Finn Thain <fthain@linux-m68k.org>,
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 port-m68k <port-m68k@netbsd.org>, debian-68k <debian-68k@lists.debian.org>,
 linux-m68k <linux-m68k@vger.kernel.org>
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
 <CAMuHMdXNF5OCjdK7+AHWTCqSEDa-n-dYdESVVSP5Jn9UqA6feA@mail.gmail.com>
 <d1d407e4df2b3558efd5769de746645823e73513.camel@physik.fu-berlin.de>
 <758f14d8-6d03-2aab-468b-170b0bbb7d2a@linux-m68k.org>
 <8e0186f61cc9bbed2373ae215e80ab7e70042793.camel@physik.fu-berlin.de>
 <CAMuHMdUACa7Z-BV077H+G0Hd=mTBqLw7VdshbYCixeVtsuHYeg@mail.gmail.com>
 <6e6f8e27ff90ce3f8535fc4f5c57049c59a9b227.camel@physik.fu-berlin.de>
 <CAMuHMdWFb2kBpEBV3PQuwyCoCDBsANZobTSccrEog7j_dcBF2Q@mail.gmail.com>
 <49a62eda6aea856df248aa223365b5230020d829.camel@physik.fu-berlin.de>
 <CAMuHMdVFrrtMkn1LSV0t0Yxed1uiyjmovu=P9jfz8jWJViNNHQ@mail.gmail.com>
 <ddef536e0645c9d7cebfd829837af653da50afaa.camel@physik.fu-berlin.de>
 <569d73fb-8ad5-46f0-bf4c-568919f319e7@helsinkinet.fi>
 <b2f74ffcd4c4a8aef248c21cd6deafcb92d86d37.camel@physik.fu-berlin.de>
 <022ab204-7be9-4f6a-a92f-2601fae1f146@vivier.eu>
 <5d8619dfe4134319b558684209f2b89c5c1447cf.camel@physik.fu-berlin.de>
Content-Language: en-US, fr-FR
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <5d8619dfe4134319b558684209f2b89c5c1447cf.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:FcKSeb+bpsa2TFxyUUm21fDiHLuCOVY++DFHhcy/JQUosTcvsKS
 pPGX4eVgi25FCCLqLgyuEpoNTChKqQ4Xu9lGEkxVTp4TsWwOb3+J7sBv8mSJAMNo8xnViwE
 3C8iphd97WN3YtF4dLVUX6R8MvBofuGZkWbXxuTvm/kBPizJsr0BJ1qpqy2RCBXsgIuFOpM
 rAx9qtH6Jo82JS3k36F3g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vtZDVJ+dUds=;iBTRnBtsBQo3kdNgibrdq7YfoJZ
 EA52oWaL+k7otQcdtPT3ulP6iCdjJZR0EY/KZTJ44wYstpG6ocdXmKCusBQZ2Vscgq1rhVmel
 FWTSLkflfrx56ge1+P86xzy08GCSp+a1hc61dEVQLbCjI8BaRaLDMAqhfM1lcqdAD3c3YOKtI
 1eQ9oR34taMi4CaWaHshyqaR6lGs10qgf/5DoZ3Ve3AdONq1HdgAZCT5Jsi8RYUjf2tYb88Uh
 iDnkvSTV5yUeX9341r99mY/eAgCCsx6lDPyI4GstsgX5caYZ52cAevoAyaj2fPGAAK33qfR98
 bxuQEJFs3SSiYEqfWUB/nl3kVQxwukLAeXv0N2WISTMTWU6Z4fYM24QgCgQwANeNBktbX6PKr
 ruRMTT30T8q9U2Lg0kHw16toq02Y5D2W3ElMurMkLBcvbKavvx9LilmAJVwWfiHd+Qm9/WnHI
 oBO3bMQQleGoKZUanIKG3qBWnX7snzA+OwmNP7p5w9JGGJygXvSWFbDtzz5se99s3WJBMaBB1
 swUEV0nxjETJvNEpcjVniXh0nz6Q+QlcgReGoBpwHaEdUpaoxdx7ICDGCDGmvY4YIUbvf+hOa
 XOdU+S46mP2oo/HMw3XV+dvsLh9W5UuoDaH4pOOy0ANGjTrRfS+N+0rfFZPxfQk4kkd7MVF/o
 dBwL/yz9G/NfiF1XqeaVEogLd2tIR5v8d+tb/yTRwx5aSqBtaVKGvpUyh66G6MoZMGjCuidJt
 7Uib6G0UbicImywPyPZTJcSzdmf6bJM/oOm9G41m1yOS4bV0Og8bGMtb6U2tMbsTyqYfSlS+Y
 BqQADnjaxmbCPO6ZFTByR6Q9ss5G+SVc5P5MTuGDFwNxFkxmFHmbq+xvMO4rIQVlXnVTm3l0k
 9SlPsuy4JFZnKM/euhNKG5OtnF77chNYXRNGaZGOfiXj3D7cRuNpo0LhTtdMae29Hq3yaWyxv
 sSFE7memOHnZoC++ZDSilIsjWmADaoyX8Kk99lOrqwIsSD0W0Ax3+HFi80TbegqMHr1R1pJOi
 o5AB8wmzdIYLhtkV9tzbdZzmiZEVbid6MgSlbyE5rtiOqpiCy2v86ZETlz3Ye6uiWYViufGkL
 w0E95yQVAgw2Befw7uojuHL0MoeZSWg3xQ46wUPQ+hzAyG1aHnrVSJs/nPwcCI95nRtSnWVeV
 tc9CfFV87spefdJN5EmSTIaRMbVW4qyPiDaAL4ej03B/5r0h9mBPOJwBkN+CPnXTwNYgaVIkN
 +rvOO1Kzkm44u+vRgmSgGrrSk9g5wSiSSbhz+hHkdBPSUOvGYh8gXEdoAuGH5KK4MBl5PSjvj
 SSRKWKkYNaCxW4mV1qej+FyWFO7TbCuS54KDwUUsux9UCkeRspqxmGi6XYCchWlIVvWZNFZZM
 /aznvBny+J/2NGdLL1TZtTtnA2JlOF7izn9nySALVlG5/jzIJ1e9iPRZAo



Le 14/06/2025 à 09:21, John Paul Adrian Glaubitz a écrit :
> On Fri, 2025-06-13 at 17:24 +0200, Laurent Vivier wrote:
>> A stupid question: is this possible to remove from debian the packets
>> that are broken?
>> (I'm sorry if you already answered to this question).
> 
> Sure, we can remove Python on m68k. But whether it will still be useful
> after that remains a different question. I would argue we should rather
> totally drop the port then because Linux without Python doesn't really
> work these days.

You can see the fix for python has been merged 5 days ago...

>> Because I'm afraid that changing the ABI could cause more problems than
>> it solves.
> 
> For what exact reason? NetBSD/m68k runs with 4 bytes alignment.
> Why shouldn't this work for Linux?

The problem is not the 4 byte alignment but changing the ABI.

You will create the exact same problem you want to fix: we can guess 
some softwares are built on linux/m68k with 2byte alignment in mind. So 
once the ABI is changed, you'll have to track them to fix them.

> 
> And I have bootstrapped Debian/m68k using rebootstrap with 4 bytes alignment
> without any problems. If you think there are problems with 4 bytes alignment,
> I would like to see them reported.

Adrian, I respect all the work you do for debian ports and particularly 
on m68k, but I want to point out that this ABI change can generate more 
problems than it solves.

Thanks,
Laurent
