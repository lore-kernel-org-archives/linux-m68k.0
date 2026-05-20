Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBA3370AC1
	for <linux-m68k@vger.kernel.org>; Wed, 20 May 2026 08:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779266230; cv=none; b=jLzk4bU0C3qrSLjgQE4t8cHAEM827nr0FK1t7sbCLlw+grPYF/mhaGJkJLqKYZ3tO6dogqCoPJgg5Ww1lu0yRpeeqa2xGuasNjvQkWw2zmcECirxA1YV7OJOT8L2ERtZAeHgwsN2ob6R/UYG52Wq7Z/4jbh0e5B9vsKlV4mr5OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779266230; c=relaxed/simple;
	bh=vEfEforBf+HuiU6fVT9GqbXgfTpWQ26iankghu3cJlI=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rpJi+WcCd3X/QGCy8jmrq4G7mVnneUPiYnp624Dv6TJAPTaCE8JYkL0N+7GAHHIQoXnOqhoW9SosVHSGNaEUMC+3oWnheUgcyuFyDAHOpNPd0OoBxK4pH4wcfQYtTpMmTar+kl3PzmQhs/sEWmkFvQvZMn4cMU/n1yJtv/5J1+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=L7vqm+wb; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="L7vqm+wb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=j1A/IetnurQuedKuwhYIfOfPsUBN5x5d0Ek3VK2lgLc=; t=1779266225;
	x=1779871025; b=L7vqm+wbLwma1BZOcVZG9ljJ7aeuVy/DdzHWf2n1H2obZsu8zMakvHxxS/IyK
	oSsx5kMmsEglQIMZlJhxtVHgs65cB6/0dyxBk12IpWfMgCHLgH6DhCJZ/QLDwTfPV++rfG2ElzB7V
	iVLZlxD44VZvl1vvAUqHDqDMJr9zSaUONzHfPsB15V9HTs77ipCoyaFZMYOqjA4wI6PVgxxy8OV+e
	7drX+oKSBbjk/d4NZwXgwEe1nDfSRz+pt+B7uiHtXLLKbW0k0V2X51RE1x0NajPb8Dsf1gx0EeEte
	C26qz/KrUeBsqBo/3mH+6UmcjOix2cNFVevmWaUzbUpS4p3PhQ==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.99)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1wPcQC-00000000xTe-3NMs; Wed, 20 May 2026 10:36:56 +0200
Received: from p5b13a134.dip0.t-ipconnect.de ([91.19.161.52] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.99)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1wPcQC-000000045Cs-2U0i; Wed, 20 May 2026 10:36:56 +0200
Message-ID: <e6e99dd2a47881aaf34ea8d1dbc5ea8d6080c1c1.camel@physik.fu-berlin.de>
Subject: First successful cargo build - Re: Summary on what's blocking full
 Rust support on m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: debian-68k <debian-68k@lists.debian.org>, linux-m68k
	 <linux-m68k@vger.kernel.org>, port-m68k <port-m68k@netbsd.org>
Date: Wed, 20 May 2026 10:36:55 +0200
In-Reply-To: <6efb67b12fd971c6d38a692d7b391ce4a75b0f4a.camel@physik.fu-berlin.de>
References: 
	<29d725b5647c176b8cef0d3442d1b3440e6a1a9a.camel@physik.fu-berlin.de>
	 <6efb67b12fd971c6d38a692d7b391ce4a75b0f4a.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

Hi,

On Mon, 2026-05-18 at 15:03 +0200, John Paul Adrian Glaubitz wrote:
> I have used Google Gemini Code Assist now [1] in order to create a patch =
to add support for 32-bit
> relocations to the LLVM M68k backend. This time, the code makes use of th=
e full capabilities of
> 68020+ CPUs and does not the inefficient four-instruction method to imple=
ment 32-bit accesses.
>=20
> I'm hesitant to send this in for review as this was basically written by =
Gemini under my supervision
> with a lot of testing of build tests.

I was eventually able to build cargo for m68k-unknown-linux-gnu:

(unstable-amd64-sbuild)glaubitz@esk:~/rust/build$ file ./x86_64-unknown-lin=
ux-gnu/stage2-tools/m68k-unknown-linux-gnu/release/cargo
./x86_64-unknown-linux-gnu/stage2-tools/m68k-unknown-linux-gnu/release/carg=
o: ELF 32-bit MSB pie executable, Motorola m68k, 68020, version 1 (SYSV), d=
ynamically linked, interpreter /lib/ld.so.1,
BuildID[sha1]=3D7e5bf08930f87b9eaee173cf163b067f620cb841, for GNU/Linux 3.2=
.0, not stripped
(unstable-amd64-sbuild)glaubitz@esk:~/rust/build$

The binary runs on m68k but there is no output, unfortunately. Needs more d=
ebugging.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
