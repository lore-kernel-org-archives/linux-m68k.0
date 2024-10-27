Received: from herc.mirbsd.org (bonn.mirbsd.org [217.91.129.195])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F19D530
	for <linux-m68k@vger.kernel.org>; Sun, 27 Oct 2024 04:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.91.129.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730003650; cv=none; b=t6M4zncHrmAcWnv8wQv7saDk6Px4dXQhMXyqLdJkIffSxb/apwGs4kkEWztT1CUN/qboYQWIdOl6KhX5zO+HrScesHsI7L70ib5cN+xmBrlj40RhVENQ7k97iLuyVikmr4BnpKbG7vvWOQm0toGU324VNCL5tpe7ePtG1JGf7ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730003650; c=relaxed/simple;
	bh=Mry7VMdSSW449iWv4LvGTZAqf6M0DCzcwn4IbCMqHPI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=dJmv3WsibYmjgZBrCIpR31pkc+yza+BQ+pxlnYufzST7dUVTf29l+dHj75PyKxbLKDqNrdLiltqLw8BoQGmC1OrtagYUtKBIp3l58kwhb/bXnua70hjcARCgJIyt7t9R1oZxbmmYitWnKMNpBXuhI0VxlCMfdBmH5JuymD3NdKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; arc=none smtp.client-ip=217.91.129.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Received: from herc.mirbsd.org (tg@herc.mirbsd.org [192.168.0.82])
	by herc.mirbsd.org (8.14.9/8.14.5) with ESMTP id 49R4NFUT006405
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 27 Oct 2024 04:23:21 GMT
Date: Sun, 27 Oct 2024 04:23:15 +0000 (UTC)
From: Thorsten Glaser <tg@debian.org>
X-X-Sender: tg@herc.mirbsd.org
To: Finn Thain <fthain@linux-m68k.org>
cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-m68k <linux-m68k@vger.kernel.org>,
        debian-68k <debian-68k@lists.debian.org>,
        James Le Cuirot <chewi@aura-online.co.uk>, Sam James <sam@gentoo.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Andreas Schwab <schwab@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
In-Reply-To: <a6ef54f6-7a3d-78d5-47d1-d4f7fc1e04e2@linux-m68k.org>
Message-ID: <Pine.BSM.4.64L.2410270420080.3007@herc.mirbsd.org>
References: <3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de>
  <d95cbe0f-696e-813a-3655-f982531dfb41@linux-m68k.org>
 <fe7eaef152b4a245c6bab76ae02946a0746bdf65.camel@physik.fu-berlin.de>
 <eb26c030-5bc9-0e2e-1222-64306bfa7553@linux-m68k.org>
 <5e8917a2-b7c4-6c06-e63f-1f05eea32120@mirbsd.de>
 <a07af4eb-efba-d8f1-ace1-06da7a7067c0@linux-m68k.org>
 <Pine.BSM.4.64L.2410270301550.3007@herc.mirbsd.org>
 <a6ef54f6-7a3d-78d5-47d1-d4f7fc1e04e2@linux-m68k.org>
Content-Language: de-Zsym-DE-1901-u-em-text-rg-denw-tz-utc, en-Zsym-GB-u-cu-eur-em-text-fw-mon-hc-h23-ms-metric-mu-celsius-rg-denw-tz-utc-va-posix
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

Finn Thain dixit:

>That would mean __alignof__(foo.b) =3D=3D sizeof(foo.b) but that's not the
>case on my Linux/i686 system. 4 !=3D 8:
>
>struct baa {
>        int a;
>        long long b;
>} foo;

That struct is just 12 bytes for you then?

That=E2=80=99s possible on i386 but almost nowhere else, and has multiple
penalties on i386 even (cacheline split, loss of atomicity, merging
of accesses, possible cross-page split,=C2=A0=E2=80=A6).

Of course, in this case, the software author ought to have made the
padding explicit or, better, sorted the struct members. But if all
did that we wouldn=E2=80=99t have this problem.

>> More importantly, and relevant for Qt, struct baa is also 8-byte
>> aligned...
>
>If the struct itself is not naturally aligned, it too will eventually
>break someone's assumption of natural alignment.

No, structs are not naturally aligned but aligned to the max() of
the alignment of its members. Natural alignment is only applied to
primitive types.

bye,
//mirabilos
--=20
If Harry Potter gets a splitting headache in his scar
when he=E2=80=99s near Tom Riddle (aka Voldemort),
does Tom get pain in the arse when Harry is near him?
=09-- me, wondering why it=E2=80=99s not Jerry Potter=E2=80=A6=E2=80=A6=E2=
=80=A6
