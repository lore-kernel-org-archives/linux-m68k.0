Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8FB1917E3
	for <linux-m68k@vger.kernel.org>; Mon, 16 Jun 2025 09:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750066016; cv=none; b=As6tA777XdyIvw4VrsLoaMAUnDxbJAfE9uFkDeyvOdzMIX8eTH1BAmid8tFscH35ihvPHBd3T1f4oT2m/TjalM/O5et3r2RaXZ+XJp1XoaIOqPFS6cqQir7Oo2E9XZ4VbplZ8JNCiokMwoE6nUqfnMq9Jn/lXw2mU3WIG6tFlqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750066016; c=relaxed/simple;
	bh=zWxfss263n4+cswvH2n0rlIbqeQUIYxURDpA/39Wzv4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gqw9C0X3I9wh5sTauUDJKzJt2Z56QNA3dOiBC9u6r4BXBxnYeS3Wmy0qW2ZOnKtSj2KQmZEw2HR/YmXsRBMz0MWkjzkH+jnWbC6guEJgve9X44Of0RK63w7HAFW1C/sPfeygVqoEW9y0N+R5VYF5ZmfXcuNLFltnr5LRrUtm3lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vivier.eu; spf=pass smtp.mailfrom=vivier.eu; arc=none smtp.client-ip=212.227.126.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vivier.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivier.eu
Received: from [192.168.100.1] ([82.64.211.94]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M4ahC-1uPRx324bG-009NDh; Mon, 16 Jun 2025 11:26:47 +0200
Message-ID: <0c3d93e4-e170-4a8c-baeb-de68a7d4d099@vivier.eu>
Date: Mon, 16 Jun 2025 11:26:47 +0200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: port-m68k <port-m68k@netbsd.org>, debian-68k
 <debian-68k@lists.debian.org>, linux-m68k <linux-m68k@vger.kernel.org>
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
 <CAMuHMdVFrrtMkn1LSV0t0Yxed1uiyjmovu=P9jfz8jWJViNNHQ@mail.gmail.com>
 <ddef536e0645c9d7cebfd829837af653da50afaa.camel@physik.fu-berlin.de>
 <569d73fb-8ad5-46f0-bf4c-568919f319e7@helsinkinet.fi>
 <b2f74ffcd4c4a8aef248c21cd6deafcb92d86d37.camel@physik.fu-berlin.de>
 <022ab204-7be9-4f6a-a92f-2601fae1f146@vivier.eu>
 <5d8619dfe4134319b558684209f2b89c5c1447cf.camel@physik.fu-berlin.de>
 <479479a8-a315-4687-af2b-4fc0efed7a6b@vivier.eu>
 <d7c6cb263b3ac949c842ca7cf483fbc7a0e032a5.camel@physik.fu-berlin.de>
 <708ea8ed-c1b3-4f9a-83fe-af979bc194b1@vivier.eu>
 <0cf54bd607a7926414d6c9a0350fe93898a235ce.camel@physik.fu-berlin.de>
 <1960b583-2100-468e-8e1e-face3f7f10d6@vivier.eu>
 <5d8b1560fb29bec6d56ff6d8aafb4931a7079b63.camel@physik.fu-berlin.de>
 <7a80e6f1-1ac8-4082-b37f-f577ca0bdd5d@vivier.eu>
 <f73add213b5c43b977967ff5c5cbd2c83c0ffb07.camel@physik.fu-berlin.de>
Content-Language: en-US, fr-FR
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <f73add213b5c43b977967ff5c5cbd2c83c0ffb07.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:J3L6LwXWLJR/Y97xLcUd+x+OOQcQeGFTK/i1B5vrq1aoN70CrqM
 8Ez1oXaYr0oR8tiCUs7z1N3uriYpmYrzC7zVvg7PF04wx+npcpy3hYfrYiaJcyQbv+CblQh
 l1TKkue+LkLbTb5hlws1Iq7KK9KBaReyEk5eF+t5d5ZK1bG5zp3zjalOLZvQrbwiV9W1m8C
 3EQUVlUB0OfqX5UWcoB8g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:lhRiSoibBlk=;lbBaEkiiK/B/2clLLiFLJSf0aI5
 cqe6HSrafNf2NG7lzv0yLlzTAPl3rfUzeRT+sFlN8OHW/pQ2JcA7gPQMU+nUm85VQCdDxdXxG
 VOPxreMtticIcq+lC55TY+H784S3HZTzZHBOeGVkSixjs3dbhaGElF851WOChr78lUskM37CR
 OY0cWuz1Ezrenr+JI8/fx/868tZFPfXe1EjvIHclqwrV+p5Zgex4PvC6fX/An1MNweGsDb++h
 Ev9Vsu8xbFnj/6sC/9ufg7Or6meQnrYLSYBJ5+4FceSHlGrWe17q/aQ5dGzMlNIGvpV1oLAHs
 ZcJiu2JSpmCdY0sSHsgGxcmoFI5yNFzJ40klwU2/bNEu5sbr+NpguPQ/lDpn5XsMkuxCn3+Yf
 0D44L8Ei/qCjrXSBb/scxiECm+82YuCHqqDkdbcYCdmQ3dm7uyU7jUHzyRj8ztK76K0OyKCim
 PQIAZMzJEqgSFa/8QwHQ2/y3YvvdbNYbvJtd/FvmCTIuQk62RrV53mlwha+qi4ebCB3EO6GdP
 9fAEJRzfy545OuDA4gEjbw6hrvsCmgD4xY+8ArzYV6ahxPNATytyUaDz+iqnOWdYxeZP6NEnY
 JZcJMRW5q6+OgGKETVZerYuS7eZy/T0Ltbcs1G5SUXcaZ1Rvq6Fy3n70Ma6/KFmKyxVdpijTi
 iIH2O36gKmM46/J7uXin8FizOxCfVr7I9VYsvupByRyYI9V9mEYJd/Y1/a4Vm3cNFZmoIbrAt
 W3OOLwo5Hj/9P7mIxiiBHb5sdGwjFcrUk8EbX/BLnqVkyvnG3LFlaOGnYz+FXIhiD4iuS6uXz
 maWlvrO/EmnlMMEqn4gxGwMNEZ4NU3b1HmRAhwWqEQ9qbmSg9UcjYK1NUO0CQkxKuF22XKtj7
 d+IMlM9ALqY3yF+ZbjSMwGnvriwPhNuJGQpEcHEXEmX2oiBqTqEk65bU00qOfsqs/v6NRZWAD
 mRjN/6xJz0YhLtf83Oavz6WpTKqC3XB60lLTi1xGl/+frayd4iBB/Iq1DZOfA7o1o22En7ZS8
 cgyGB4Oq85jK+xw4sGWJk1TmWUpLBoea5h1s6hiSDz2DRrjTIBsC5LvCo0cPBpmw25fhX7r7o
 YuBRyztlKBUfkXWFNAMFBz2zQwOJeh5j9+96KzFn4f7Sl4suJ+KIISKKsj3szQ8eNOr7H63fb
 f+xIszOJZAdo0qu6Qq0iQEzE878ujuB4dCuTDUKXzLpmRYceAD/GTCmMzj2o3tvc5dykafPl7
 oqy2vajHSZeYuN7xjaUFAxcthVf8Dc1M0oNuLuQmju9Ww5n2CSw9mEOcATXoEPy/hICQeZ8vs
 DnTWXW9r/kq0bdck/RNFebruoa3LDHt9cIVchDK3JnTEO1p0nVpmw0FiFcAUp+sOV5wSLD8oE
 kHk7gWcnkLsChcLc/JfACAlotPAdwEdajQcSRUyPwQ23FCpwvCvxeNz/El



Le 16/06/2025 à 11:15, John Paul Adrian Glaubitz a écrit :
> On Mon, 2025-06-16 at 11:10 +0200, Laurent Vivier wrote:
>>
>> Le 16/06/2025 à 11:00, John Paul Adrian Glaubitz a écrit :
>>>> And there will be a problem with binfmt_misc because we can't rely on
>>>> the ELF signature to know which qemu-user to run, the one with 2byte
>>>> alignment or the one with 4byte alignment?
>>> What about the ELF note [1] that David Brownlee suggested? Can these be used?
>>>
>>> Adrian
>>>
>>>> [1]https://www.netbsd.org/docs/kernel/elf-notes.html
>>
>> binfmt_misc doesn't use the sections to select the interpreter, but the
>> 128 first bytes of the file.
>>
>> I think you need to change the ABI type in the ELF header:
>> https://fr.wikipedia.org/wiki/Executable_and_Linkable_Format
> 
> How does binfmt_misc handle the various MIPS ABIs then?

It doesn't and it's a problem.

Thanks,
Laurent

