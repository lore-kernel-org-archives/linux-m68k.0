Received: from evolvis.org (evolvis.org [217.144.135.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0122251016
	for <linux-m68k@vger.kernel.org>; Fri, 15 Nov 2024 01:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.144.135.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731634283; cv=none; b=EwHiEyOynZAw/VRtcV5OyU8AzCyuR1/NDfQileo5hhhy65Vv1RRFcGbN28j9FHkzlvmd/UidNal5Kyc6K4jxbNnRKll8POej6iarnYFM/m00wxQdg2DGAVXsHqUv+Tm9szSfk4xAsRn1gM/Skx+Z/vcB7dh75JebWc97TSITgLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731634283; c=relaxed/simple;
	bh=je2oCUsHK+WFpY8Y+0FBvG5Nsx4CziQvvVbdzs6VvmU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=cQyLv1tHAJQ9DLKkniCIB8Nntjb3NDz70kPOgL0KlITVxFXWcJ3NzPGZUWzl603ihVb1VRpFurntdKs8zifsGculo2D/6Xmu4FGdkZydq9U6wT3lstqsX5SoqRKVE7kXN1jXL7NQe1S24gybrK0lOrk7mmPuZavuMT5mJjIYH3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=evolvis.org; spf=pass smtp.mailfrom=evolvis.org; arc=none smtp.client-ip=217.144.135.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=evolvis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=evolvis.org
Received: from x61p.mirbsd.org (xdsl-212-8-144-112.nc.de [212.8.144.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X448 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	(Authenticated sender: x61p@relay.evolvis.org)
	by evolvis.org (Postfix) with ESMTPSA id D18061002A4;
	Fri, 15 Nov 2024 01:31:15 +0000 (UTC)
Received: by x61p.mirbsd.org (Postfix, from userid 1000)
	id 0E7E6142956; Fri, 15 Nov 2024 02:31:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by x61p.mirbsd.org (Postfix) with ESMTP id 0965F142955;
	Fri, 15 Nov 2024 02:31:15 +0100 (CET)
Date: Fri, 15 Nov 2024 02:31:14 +0100 (CET)
From: Thorsten Glaser <tg@evolvis.org>
To: Finn Thain <fthain@linux-m68k.org>
cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
    John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
    linux-m68k <linux-m68k@vger.kernel.org>, 
    debian-68k <debian-68k@lists.debian.org>, 
    James Le Cuirot <chewi@aura-online.co.uk>, Sam James <sam@gentoo.org>, 
    Andreas Schwab <schwab@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
In-Reply-To: <c0b6613c-22c7-674b-f6ff-9a5c36f09732@debian.org>
Message-ID: <dd438a1b-43fe-38d8-b3c6-68e8791f4350@evolvis.org>
References: <3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de> <d95cbe0f-696e-813a-3655-f982531dfb41@linux-m68k.org> <fe7eaef152b4a245c6bab76ae02946a0746bdf65.camel@physik.fu-berlin.de> <eb26c030-5bc9-0e2e-1222-64306bfa7553@linux-m68k.org>
 <5e8917a2-b7c4-6c06-e63f-1f05eea32120@mirbsd.de> <a07af4eb-efba-d8f1-ace1-06da7a7067c0@linux-m68k.org> <Pine.BSM.4.64L.2410270301550.3007@herc.mirbsd.org> <a6ef54f6-7a3d-78d5-47d1-d4f7fc1e04e2@linux-m68k.org> <Pine.BSM.4.64L.2410270420080.3007@herc.mirbsd.org>
 <b9ef3e70-6ee0-3e4f-185c-afaa8f512792@linux-m68k.org> <CAMuHMdV4T1jELrZJbyxkYDo4MSfm=2CGCz2tJ6DqOqjjiN5_AQ@mail.gmail.com> <d4e59a96-9d1e-94ca-313a-b577338d9d6f@linux-m68k.org> <c0b6613c-22c7-674b-f6ff-9a5c36f09732@debian.org>
Content-Language: de-Zsym-DE-1901-u-em-text-rg-denw-tz-utc, en-Zsym-GB-u-cu-eur-em-text-fw-mon-hc-h23-ms-metric-mu-celsius-rg-denw-tz-utc-va-posix
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

Forgot=E2=80=A6

>tg@fish:~ $ ./a.out

struct baa {
=09int a;
=09long long b;
};

#include <stddef.h>
#include <stdio.h>

int main(void) {
=09struct baa stct;

#define t(w,s) printf("%s\ts=3D%u\ta=3D%u\n", #w, \
=09    (unsigned)sizeof(s), (unsigned)__alignof__(s))
#define o(w,m) printf("%s\ts=3D%u\ta=3D%u\to=3D%u\n", #w, \
=09    (unsigned)sizeof(stct.m), (unsigned)__alignof__(stct.m), \
=09    (unsigned)offsetof(struct baa, m))
=09t(int, int);
=09t(llong, long long);
=09t(baa, struct baa);
=09o(baa.a, a);
=09o(baa.b, b);
=09return (0);
}

bye,
//mirabilos
--=20
[16:04:33] bkix: "veni vidi violini"
[16:04:45] bkix: "ich kam, sah und vergeigte"...
