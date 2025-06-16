Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36EDF1494C2
	for <linux-m68k@vger.kernel.org>; Mon, 16 Jun 2025 06:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750056494; cv=none; b=XgZiYrVDaV7nYcRhbx/DbV5SR0KH5v5u216aQHqfsNxVpuIOLydpv3Odtxd6OmCQdQkSf4gI5emj8StWo1kvzznlaaLt6hbKmeqNkLkHCHNiWmLpQ02fmo5s6+70AI/K3FuvPT6jInrlYdj+aW/niE4srcOmjOdoiVGuDG5NQP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750056494; c=relaxed/simple;
	bh=e0itih9D/v5169EjeNXiK8AqqUkd2SoWftxy11V5ns4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qMLPy8Aa9lOxXc1iMuAeYOIoDeR+Fpc7028oZGMwNq3rm+tlNUmDMfZzt9KM1QCOtEJrmGRraIpgvmUEOYQPscbhsnX5x1Emy9ZxFCumljMiL+p6nb0EDxx1fcuLBYbVd/rN4lN9sTnLd14uIuPL7xzSsBR93+Q/UK9bO0qWoT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=WNMDKMzC; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="WNMDKMzC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=p6dv7Jr1lw/mD8VCqqXniVGHAvVtKuq8TYP6w5TRiP8=; t=1750056492; x=1750661292; 
	b=WNMDKMzCPVft3KXrfzswWayBrh7qUEdTkDNLdGjiPMphZ4D8uwc/SFEunjeXJOwWaYBYJWudk4J
	JPVCzufvfeJ6zbaQ1YGoY4vv7wVUPH2iTWgM8jQUGowt7PcA+TMkDPRuXNPud1zhGqUjkNiodCX+P
	+BWqn/JOcvwbZDeWRiLpK5JKTI8gS5qcyquHQo7IMhNP15YWPzcjPs5qPsowe9+ZOL3dI7xvnXXau
	t3IQcRVjLQQPh9so9SqfRJW/u5hUx3qFTZvNrWn8k03Woz6r50JJUL1QlFDsVZE5yYH3zQrPKifY1
	fSJPxCPvYx+RqEjPJ0+sciyDMXwH/40ssLag==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uR3da-00000001XVP-22Id; Mon, 16 Jun 2025 08:48:10 +0200
Received: from p57bd96d0.dip0.t-ipconnect.de ([87.189.150.208] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uR3da-00000003PCz-18cB; Mon, 16 Jun 2025 08:48:10 +0200
Message-ID: <c5f22c41ba417bf20446f823f527791a51af4701.camel@physik.fu-berlin.de>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: port-m68k <port-m68k@netbsd.org>, debian-68k
 <debian-68k@lists.debian.org>,  linux-m68k <linux-m68k@vger.kernel.org>
Date: Mon, 16 Jun 2025 08:48:09 +0200
In-Reply-To: <CAMuHMdVzfDxv24wp+AyJs2253+8RHB51oM1Qsc3NUNaf-jE+nA@mail.gmail.com>
References: 
	<ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
	 <442267d5-241e-44a5-9b54-fee06bc5c03b@yoseli.org>
	 <9013836044f8bfb7f0cd62ba536f6a1c75034465.camel@physik.fu-berlin.de>
	 <80f5c684-638b-4486-9026-1f8689a7f147@yoseli.org>
	 <95e56d983ace4976143c7e1180ffe5606c0ee3fe.camel@physik.fu-berlin.de>
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
	 <3e499af848b28c640334f329010d3d45c0b12c95.camel@physik.fu-berlin.de>
	 <CAMuHMdVzfDxv24wp+AyJs2253+8RHB51oM1Qsc3NUNaf-jE+nA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

Hello Geert,

On Sun, 2025-06-15 at 11:26 +0200, Geert Uytterhoeven wrote:
> Sorry, I didn't know you have to coordinate this with the glibc project.
> But you have to do something to mark it incompatible with older versions.=
..
> IIRC, I saw Debian bumping SO versions before...

It doesn=E2=80=99t really matter whether I would have to bump the SO versio=
n upstream
or in Debian. In both cases I would have to convince large projects with co=
mmercial
relevance to make invasive changes to accommodate for a compatibility chang=
e in a
hobbyist project. This will fail the same way as most attempts to get patch=
es for
2 bytes alignment support merged upstream.

The original motivation is to make a change that will fix the alignment pro=
blem
without large changes to the source as the latter is something that would b=
e rejected
outside the m68k scope. Both Debian and upstream would not want to integrat=
e such
changes and rather ask us just to drop m68k support altogether.

However, I think a good compromise would be to integrate the suggestion by =
David
Brownlee to add an additional ELF note to block the execution of 2 bytes al=
ignment
binaries on systems with 4 bytes alignment.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
