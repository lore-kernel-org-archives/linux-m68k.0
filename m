Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C991DF271
	for <linux-m68k@vger.kernel.org>; Mon, 16 Jun 2025 08:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750060848; cv=none; b=mBgbBVOcX+nsNrcqA56QtdmemW4ok3GHdWoEo8aazlSbzE/wol5pvG69XWSR43CTj7gRd9XaREGmkxmBKrAmUjnEbX1Q8BEZ0jUZxws741X95o4H9/B1jtpfCeo2KwE+y0i1ihH8YPiONyFY1Ft6K50HFGZVmhc5mftWoKHRFmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750060848; c=relaxed/simple;
	bh=6KIvSYFzSxyn+DY46C8pdu36XHRAPCz8DNgE6D0s9rw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lMyEZzQtOA87dqCbIZaRqMAOUlHzFLAktFe3o6T7wxxVaBpd0xRBFeD9qVw9h2osJYzewC0SFDlS94B7U2EH6UhK8q7JuzadmEV3LlIgXUbFnFzpP7Fi1cB90JiXgOXMioFvy0NbPOqmTg5RwAK8/y75v2eDiidSL4UvX/R92Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vivier.eu; spf=pass smtp.mailfrom=vivier.eu; arc=none smtp.client-ip=212.227.126.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vivier.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivier.eu
Received: from [192.168.100.1] ([82.64.211.94]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N0Fh1-1ukxC42sT9-00tcr6; Mon, 16 Jun 2025 10:00:31 +0200
Message-ID: <708ea8ed-c1b3-4f9a-83fe-af979bc194b1@vivier.eu>
Date: Mon, 16 Jun 2025 10:00:30 +0200
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
 <479479a8-a315-4687-af2b-4fc0efed7a6b@vivier.eu>
 <d7c6cb263b3ac949c842ca7cf483fbc7a0e032a5.camel@physik.fu-berlin.de>
Content-Language: en-US, fr-FR
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <d7c6cb263b3ac949c842ca7cf483fbc7a0e032a5.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:GXn5Xewx5HxsmnfHryCkm+KEYB5OMe+BEj2E0ISFT7SURCK2xKC
 pzJ9J0WaxlKoY/b8c9w76RXta8rQMiDBzesXNaTz1UVO+lwEwX3PRoHl8yofddrV5DnFG0z
 wwKaE7n0s2ODZHAu/D6RLPeTSWzOMhWeK8KOU14Ph/OD3XlWPxQRsErRTwq1GVSsJoNZxLT
 Pmw9rCRrWSoyi3N4O128A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:owpbcs0twP8=;fReewq7dW+HPZ3cZsS3QHYM8jGc
 059UuIDwQGnDVK6p6HCX53ONjcxC6KGd8KReAWDi7+5xAflJq8TEsIU8AURHI0YO+55vrsP4b
 MxaSKDsIOcdoW3vtfSmKmamqa9Xjm5L2824L/ur6otv/lYNB66MZf8HHr31x6c7eT0Bb3XGEx
 NNBujRwmNjxi2QpdCtQuURjuhPzI3w9blOxgWLICQmQpforqJF3YLMVqqQ3VCpQqb569jvfPN
 3j5cqJfUTL7EyEyyKk0Q32lLSxoTCy+TGklGONGcHqvbpPOGEHyFnzzJqfW8vSm1YjFTPqln4
 UcyyYADRxQcDCI4TiehQr/OclE5Dj/pJyNaF1HFjezCJHJfb8PnqbFOqb1DdvSdHoyfS3Y+lb
 b57JYwZGLgUPHr8WL3oIK9HL3onYfFUFIuDZbFDrY4R2R2M2SDMphu78JsRx1TIZf9FJd8dly
 3wStMTA8M7NEjUoxtagDWHRMLV2CUOB/eb4EW488v7thrOOeN1k09EwJpcCLUr+RBYbJNP5Gu
 0F6Gw2caSFJZC5St9wYgP/vL1upG4jzTC3LdtUIe31Wmff3Gj86yy8S1iZ4b149VnE6dYXnkD
 XV9cQCi7ziEaqJeZrRi9gh/7JmR2/nETQ9U7UBaGLD7AlpU5irDOMktJBN8BG4GNL22w8oYnj
 NIHqOPO+HkMEp6Yd1DsFApIiYF4nTrq5ieAl/whZjSw3xJdZ5a0ugNRuvKf5sO3+thQilaZbe
 MeIIXhJKVp3WZbWc6J4u/qCaDTTLg3J1XZMzT/ltrqyGYynDyf179XtkNhnnDmQQcdBtbqADt
 raksinhHa/dhUnwNihM4BoO5kOwKTt0V7ftYDwBKUnOfQk18RM5Mposd3B8igQOvoUUhdC2V6
 aLCvvJ4kwSb39dVWqKL/nNbrZkLG7SlngqwRBse57Fvw9oEXKMzYGXoSwYLg5d8ZFrmRslr/7
 qbWvQaXd26GfB9f1gDT5F2AuSYiv3qS1gi2mjwQzrm3bj8zUziwMy78BSLop03LkjPYSV3/ov
 54Y+eThCbsxeXtjQT1FrZ08yP87ChtogVYL90618hxFsEKzQi7dBg7CwH4VWdofeVltk4hGyj
 5FbR1prnKZv3iogHh4rCRHJgI8UrUP/EhzTygHh6u+hjpvVYK3JV/xV5tZVtc11w/hTUVXVl0
 tmqsvAWMc6yDlqaQnyZrPPsUec7sRmbrsQnmDhlcMSDGwuE8WusKwG+yHfNKuFHMExQDVsa83
 KZ8SQBfZh9G0XKzIfakZvEEddUdWNXoDtZNSLtImainaQR6kOkliiJXV+NLFUIgAmeS4tfyXM
 ZTXouX1IBjhM67pzToOemMIvMYa67X6KrSvDcQkVGiqBYDOdGZ3vKY3/MATEHNiYhct7TgL+Q
 cd1BQQ048euf1BxwX/BRSE+FtArDEqzkr7+yI=



Le 16/06/2025 à 09:39, John Paul Adrian Glaubitz a écrit :
>> You will create the exact same problem you want to fix: we can guess
>> some softwares are built on linux/m68k with 2byte alignment in mind. So
>> once the ABI is changed, you'll have to track them to fix them.
> Could you point me to these packages which assume 2 bytes alignment? I'm genuinely
> interested as I would like to put these up on the wiki. So far I haven't found any.
> 
> I have used Debian's rebootstrap to create an initial set of m68k packages with
> 4 bytes alignment and didn't run into any problems yet.
> 
> The Gentoo developers have also successfully created a chroot with 4 bytes alignment:
> 
> https://dev.gentoo.org/~dilfridge/m68k/
> 
> I have tried it and it worked fine for me with qemu-user.
> 
> So, if there is any software that is incompatible with 4 bytes alignment on m68k, I
> would like to hear about it.

qemu-user is one of these softwares that know m68k has alignment of 
2byte. All the structures translated from the m68k chroot to the host 
kernel are with a 2byte alignment.

Thanks,
Laurent
