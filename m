Received: from anath.zia.io (anath.zia.io [192.80.49.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80E71EEA3C
	for <linux-m68k@vger.kernel.org>; Sat, 14 Jun 2025 11:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.80.49.0
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749900054; cv=none; b=dn7yNIXzjuTx/RkjN9YzgEP3Xp2PZ6PZ1fgCOA8HUHvMTNTCaHX3AdjH2/wZN3xPAcU4E14/XXyG1giXfXLW6BoUTjfgVm4iY8MeViOvmDul3bfEkDPVYZ1o9EQddmNGAUR6FDTRrdywCdiHTYFZhArrxxRZjxzPKI/OIg6yhr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749900054; c=relaxed/simple;
	bh=ITfCnVf+02QXprUtbiOhj3dcB2053j02Na3IPV3GcKo=;
	h=Date:From:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=LgCaxZFGz+GQPkWDNHpdfZrQvYtqqWzI2ICaEqNDx+t8Yc4M43jWJTcNr2xJGxvFVpf16Rw3G+3bKXUBD7imwvgHFUr7x3IjQNWZJongvGwwMtyN7nvkU50/Ax0uXDn9oFGUhPw0bJ8EvonlWFDBhxMzpgq/IzqKuffLXcZPfzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=klos.com; spf=pass smtp.mailfrom=klos.com; arc=none smtp.client-ip=192.80.49.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=klos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=klos.com
Received: from daisy.zia.io (daisy.zia.io [IPv6:2001:1890:1bb7:b400:0:da:15:4])
	by anath.zia.io (8.18.1/8.16.1) with ESMTPS id 55EBKhPI018736
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <linux-m68k@vger.kernel.org>; Sat, 14 Jun 2025 11:20:49 GMT
Received: from daisy.zia.io (localhost [127.0.0.1])
	by daisy.zia.io (8.18.1/8.18.1) with ESMTPS id 55EBKbXo022487
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 14 Jun 2025 11:20:38 GMT
Received: from localhost (john@localhost)
	by daisy.zia.io (8.18.1/8.18.1/Submit) with ESMTP id 55EBKb9p016067;
	Sat, 14 Jun 2025 11:20:37 GMT
Date: Sat, 14 Jun 2025 11:20:37 +0000 (UTC)
From: John Klos <john@klos.com>
cc: port-m68k <port-m68k@netbsd.org>, debian-68k <debian-68k@lists.debian.org>,
        linux-m68k <linux-m68k@vger.kernel.org>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
In-Reply-To: <edea4668-e052-4071-b307-c3d199108f5d@helsinkinet.fi>
Message-ID: <d4096687-0f2b-2e64-124d-b2a45578ba16@daisy.zia.io>
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de> <758f14d8-6d03-2aab-468b-170b0bbb7d2a@linux-m68k.org> <8e0186f61cc9bbed2373ae215e80ab7e70042793.camel@physik.fu-berlin.de> <CAMuHMdUACa7Z-BV077H+G0Hd=mTBqLw7VdshbYCixeVtsuHYeg@mail.gmail.com>
 <6e6f8e27ff90ce3f8535fc4f5c57049c59a9b227.camel@physik.fu-berlin.de> <CAMuHMdWFb2kBpEBV3PQuwyCoCDBsANZobTSccrEog7j_dcBF2Q@mail.gmail.com> <49a62eda6aea856df248aa223365b5230020d829.camel@physik.fu-berlin.de> <CAMuHMdVFrrtMkn1LSV0t0Yxed1uiyjmovu=P9jfz8jWJViNNHQ@mail.gmail.com>
 <ddef536e0645c9d7cebfd829837af653da50afaa.camel@physik.fu-berlin.de> <569d73fb-8ad5-46f0-bf4c-568919f319e7@helsinkinet.fi> <b2f74ffcd4c4a8aef248c21cd6deafcb92d86d37.camel@physik.fu-berlin.de> <86c91d1c-cfc6-44c9-8883-d9ae46c3f4c3@helsinkinet.fi>
 <8ccde8667a0d1e005756723af21eebd610868acd.camel@physik.fu-berlin.de> <edea4668-e052-4071-b307-c3d199108f5d@helsinkinet.fi>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.4 (daisy.zia.io [0.0.0.0]); Sat, 14 Jun 2025 11:20:38 +0000 (UTC)

> I don't see in above dir e.g. LLVM or Qt, which were in the Debian 2-byte 
> alignment problems list:
> 	 https://wiki.debian.org/M68k/Alignment

Our package lists include as much as could be built in a given quarter. 
The current quarter has, for example, llvm and clang:

https://cdn.netbsd.org/pub/pkgsrc/packages/NetBSD/m68k/10.0_2025Q1/All/

> Are those in some other place, do they have other problems besides the 2-byte 
> alignment, or am I just blind?
>
> (Many other less relevant packages from that Debian list seem also to be 
> missing from that NetBSD dir.)

There are reports which include build failures that will be available once 
the quarter is over, but the primary reason packages you might expect to 
be there aren't is simply the speed of our build machines.

John
