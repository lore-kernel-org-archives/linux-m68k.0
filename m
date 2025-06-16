Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56132E11D2
	for <linux-m68k@vger.kernel.org>; Mon, 16 Jun 2025 08:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750062783; cv=none; b=ZLIms1thnhYzo6jzVhKus6Tr2yz/aayguc4+FPnarJo4hdZQB/S+uHV2PdeY3K+ly5B0fs8ahCIAFtxa4MKGcLpbo8YI8xMl4PsNmpy8WiUHxaXDmcCGARvuzh69XvhqXQLt4dUa4maDD2/O+LUuFGOgjHbZKMIKGpwa819gUcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750062783; c=relaxed/simple;
	bh=9OvK5Ye5GWAsdrS8j3mYVPGX+KWELYhQK7xAXtfAdhA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mVqQkfVHUKlWAPscfl35bKX5OLpX7kiTP4LePT2V2aDLfmW9mpEjtIUOV7MiokU7Zvtig8JCryfChCBxfYq9OrjeQlzWqA3SiLP+UdgsgIdl0IpZhK9EmCM/TQiF/XJKPtzslnC0pRAQavEQaYrNos9CLuTh6Svx7JR0r+cT/YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vivier.eu; spf=pass smtp.mailfrom=vivier.eu; arc=none smtp.client-ip=212.227.126.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vivier.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivier.eu
Received: from [192.168.100.1] ([82.64.211.94]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MDhQt-1uXzHf1ntP-00G9Cl; Mon, 16 Jun 2025 10:32:52 +0200
Message-ID: <1960b583-2100-468e-8e1e-face3f7f10d6@vivier.eu>
Date: Mon, 16 Jun 2025 10:32:52 +0200
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
 <708ea8ed-c1b3-4f9a-83fe-af979bc194b1@vivier.eu>
 <0cf54bd607a7926414d6c9a0350fe93898a235ce.camel@physik.fu-berlin.de>
Content-Language: en-US, fr-FR
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <0cf54bd607a7926414d6c9a0350fe93898a235ce.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:zsQ0lOghRLKJmFvgX8a37muPp3L1iZOdiMqU5xJNEo4Q8awJU2c
 eP12lS/bhvAH79BRi7MChaoH+gc6+3w8hAmmXSBl6RrIFYwfxYsj3uGN+YqMLKGilLy2E2B
 OcEqrJ/aW0l8s1vid1t47IEVLfuZeloXHoRSsU2eHCEwKomvijHIi90tJqum4BBOqOH6Dfs
 VCmI1piVmt3VW6M9/V+aA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:FgJ0/CacAnA=;ImMvXAEcUNtUztQHXvsdZYPg8Vz
 DVdjyA6vkD91Pes1laOMeZS2MFOdEndJ2vUZhSVbnoU/hqCvYmlKFpT0ht60IbkiQGjWtgIcR
 z6Gg96PediZhUdwKoHavLcb36qjrljjJjwI6iIfDAdq6t1DX+DvtP1de/cKcrJLpASHd+O1sk
 OdoLmYZairFRKR3OtVRfrzn6pKNuZQ3JsqlC6i7vjM9vlF9HbIBYw66RCy0CrrVwNqwEvh1Kr
 jLiCMhKC9EFWMPf82UmHGGmq4mAaxxXpFbKP28L3sXy+01HexoRJB9Zjt7aCJey0J1rYpKoml
 ue0RIM3v08v+yZYa93w31oAwfenTWhqbKFdzzktyl+mGpmOMR0wT70pwUCsNTJ2mCN67n5ttY
 kTiObYdbGjBMI+Bz1WklUJylXKyFUgukKcn5GE0IwcZSIJFe019woN1xptOV8ckrceD+hBWSs
 oA1oamvkosvgArxc90/odmtbXJawSiAtzAx8h+Ou5XJKfpl+M2qZyXszwt7iSejL26HCOeQ4p
 3oMWeywMKPwVTVoiJy6KrmZ2F1F1e330YpLZD1OUWzPXSUDiBKH4OIEdef5PLQPOinXPMmcbr
 utIudFPPHKBXrIkW3qPFexiQ+ggTZjiiff7cCSaNqH1nxPtvCtDD3Dyzi0WkYBFjaZ4iOCmuw
 rLwIJEFX5oFYDFasUr9W9isGIVf8ktrCWCr+II0e+kSKJBNuufSCOVUOvW1shSJejmrYjxxFz
 J1bgGzTT43ziUzwwbnrWUntTF5t2ZZNFOYYaiaGmgs4mgC20Uht5JGugzVgGQo3MHVtY3TGCU
 XKzp5WpMzxAW0hect2UsbX3JHHQanV8trtPgdg3NSPKdrinFv3OmYf15lbfkqy55YUXQAxwOG
 4lBZHuZbuYXMJjqo2/FeLcNdgmdalW2O9aC/JEKjZwtn0l2e9mBQBWQOpedobaVsW4bN+MT6c
 dXQQiEMoEPdlsok2vGVb+j9lJk0TYqJVyCoKeNPa/nZEmD5G3RTBjqAqgFiKuDj3sc/OlYzub
 W3J3zbPbxP1K6cH6235Cw1yZHKWNTNjlJscKHJq+R+Msl1lNEhH71agdW8RNNsoTkNWCrfPun
 8E5OkRISMzjCNv2hNIp6uRDmUWovBsAwriN8sYuny6JM7+tmQC48/BdUhZ63ojC6bjFG08ubm
 mNzXURXxFSS0d7qJM/elw99nkFfSuLj9qMzKbcigPFRSxxwL47c6pdWHUl1P+DaKgRJ7JbwYf
 B/F2c8H67ymBcDotyAvTG+leBXH7k6qEuAtc1JcauhTGqHIqogrqV3bd0DfxT7DnT7egOvmf9
 XZQKysXJmKfIwLAVn19eI4nztBkbE4AmPLXmv64Rwo7j0sgBzAh7rUbg1yzfxuhMXd+1lRAQ7
 RBl6oSzcsLzAvFT5Z18Hv3Cv9YTGpkPxcEeGA=



Le 16/06/2025 à 10:14, John Paul Adrian Glaubitz a écrit :
> On Mon, 2025-06-16 at 10:00 +0200, Laurent Vivier wrote:
>>> Could you point me to these packages which assume 2 bytes alignment? I'm genuinely
>>> interested as I would like to put these up on the wiki. So far I haven't found any.
>>>
>>> I have used Debian's rebootstrap to create an initial set of m68k packages with
>>> 4 bytes alignment and didn't run into any problems yet.
>>>
>>> The Gentoo developers have also successfully created a chroot with 4 bytes alignment:
>>>
>>> https://dev.gentoo.org/~dilfridge/m68k/
>>>
>>> I have tried it and it worked fine for me with qemu-user.
>>>
>>> So, if there is any software that is incompatible with 4 bytes alignment on m68k, I
>>> would like to hear about it.
>>
>> qemu-user is one of these softwares that know m68k has alignment of
>> 2byte. All the structures translated from the m68k chroot to the host
>> kernel are with a 2byte alignment.
> 
> And yet it works without any problems so far. Please try the Gentoo chroot yourself.
> 

Because most of the structures are correctly aligned by default, but 
some of them not. You must run glibc test suite and LTP to be sure there 
is no regression.

In QEMU, alignment is defined here:

include/user/abitypes.h

for m68k the values to change are:

#ifdef TARGET_M68K
#define ABI_INT_ALIGNMENT 2
#define ABI_LONG_ALIGNMENT 2
#define ABI_LLONG_ALIGNMENT 2
#endif

And there will be a problem with binfmt_misc because we can't rely on 
the ELF signature to know which qemu-user to run, the one with 2byte 
alignment or the one with 4byte alignment?

Thanks,
Laurent
