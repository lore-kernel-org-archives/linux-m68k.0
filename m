Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D343E3FBB3
	for <linux-m68k@vger.kernel.org>; Sat,  7 Jun 2025 12:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749300950; cv=none; b=nsxLdfZ2wXF75LjbnY+grSovRtYwunsgahOndZpmc1OzdZtr9vhuhoc7A91lhWqoiqqNmw2HWBo1mFJEmlvBcCKXa7oV3vH1Qnkf/uTREuH9we1sutZGRr2qXXbszRHoUkL4EH4Dt4pdI/C9wRma3M6DYBMtXYehGMK5++qQwZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749300950; c=relaxed/simple;
	bh=VycJpx+jh8OEhNeG/D4n+++d3GQLMZgVZ3cPZVU4Bx0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BHf7jpYWDxV8Ror7duJ+z9FDUXg1aRTwddZZqfcreNrbwCSKHRSoA2mk7/HGiumViKxUNugxL+D0BH0gMwFESKIHyGEvAbEWIAr2lDb8obm+uUIkfoepUD/ujEB03oamBbWi16f9lXz94z2NagwIO9Lz3xDSgiTgO2CJG73ybeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tethuvudet.se; spf=none smtp.mailfrom=tethuvudet.se; dkim=pass (2048-bit key) header.d=tethuvudet-se.20230601.gappssmtp.com header.i=@tethuvudet-se.20230601.gappssmtp.com header.b=mAk2MJQu; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tethuvudet.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=tethuvudet.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tethuvudet-se.20230601.gappssmtp.com header.i=@tethuvudet-se.20230601.gappssmtp.com header.b="mAk2MJQu"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-32a6c473e28so2447801fa.0
        for <linux-m68k@vger.kernel.org>; Sat, 07 Jun 2025 05:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tethuvudet-se.20230601.gappssmtp.com; s=20230601; t=1749300944; x=1749905744; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VycJpx+jh8OEhNeG/D4n+++d3GQLMZgVZ3cPZVU4Bx0=;
        b=mAk2MJQujrDWsEH7uhbdNomt2IGPbZmz6qaxJFjKrmiFBgTyQkbY3i02Naw+lkdRJh
         49lWcaYrGQbRnXN5NFq5RTi68nfPxam1Jx0OuapVhmpmM2hBBF55XHbh3bzkwvfvLkfh
         bNlNp5Cz03vsfo++ECvNcR16xekD2YZvCYkRVlT22cTjcPpinGKpIOlrqzp/NYgpyydz
         4rrMC0VYrhXAOZMxtY5XJChI7aHc8JLT9dNs1LNKLsnmLdsjQWol7++xVjSmrJQereOL
         k0wJA97w1u+FN6GOj3w5w8wcss3CnwG4kQAwQcjuLBcp3XAfZ8uJ0c5CVWXbKIWRjZMz
         8Abg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749300944; x=1749905744;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VycJpx+jh8OEhNeG/D4n+++d3GQLMZgVZ3cPZVU4Bx0=;
        b=WZnxYhRiUV6+UdUmUVYdtRdH0qJeVrRhDR/C0ZcxfeS84CqNTt/6NiN9NjGhAzYfNW
         h3y3jCKC+0dHqTE+7kqNagrr7fZrW0SvgnAkQtf+QW3iLuafO3f2mp5nh/4ZxHcZhdGN
         xRBg5ehv+cegKJ5jtOxJHdRrbNZYRD8L6VhUU9/AtePp0ZPEQS6I8MWNdmFQDwrA40VC
         oRSjd8IF5B1MGkqOS6ibgPpS0oqw9bRDL4YQNpQl8Ao2I0j1EEEfimWRs7d3Jwo/N9dh
         A5lDV/yFW++Mr3NMxdALIXjdClc/uFTw61UjEUGgha89B+a6G4cwaXF++jEERelRiAVs
         q4gw==
X-Forwarded-Encrypted: i=1; AJvYcCU6yWUcIh2DmfXX+E7LQIZ/dOyxoxSStz2Ra/c7dlXUFZzTH5WeINP/4JZC7vYSmdNPff+VTCcBgx1x@vger.kernel.org
X-Gm-Message-State: AOJu0YyMJrURCDNwg59NfRW4Dvriof0iag0lt7oR+60AzBgZgds64S7j
	CF6QEakrrIu5j/Q8V0WeeFcUdToZzvvFCiRkJ3GDffwKNwFivxEXsRE+Dn8gaLU+35g=
X-Gm-Gg: ASbGncvvG/bQ8EwdUxI9Nh9RyMxpRD1nmtn1o21ij6d6cBfbqGsEvTegDU4J8kN67Uc
	OeTMNKtPH/85doXt6W70rhSYrnF5rI7V3zZwg6EsUBr97fh2j+mXuUGFXXqOikWUWW7WH1ZM/aG
	TC66rP1zhHtbLYm/8TaaFgmfx40dQyU0efuAOI5YWYbHjFf9jcGOihWHWuor6ZgZXoV6VCMBoWe
	7ocYU+nneVf1R1MhJWkHmhx8N5LSl8UeXIqInzFntU9eS5iA+ylSaeyR7ARtmJXwhlKnoGSLnw5
	oxNUYEJ7nzvGYqeepcHTx/TQ9DgFmmNckAdzbtLwvQG9KclEZW5h85ISh9yDVp4UB0NoQ7DKkWM
	xueqjbfdxgMwx87G1egggoq/h
X-Google-Smtp-Source: AGHT+IF7snC5Uv/RJYA5pyyFhZcxVVlH4HWFKJDsOifq/RBvMTRSevo5s0cSBKDiZHjwQF6CEH5DQg==
X-Received: by 2002:a05:6512:3191:b0:553:6514:669e with SMTP id 2adb3069b0e04-5536879836fmr596551e87.14.1749300943569;
        Sat, 07 Jun 2025 05:55:43 -0700 (PDT)
Received: from [10.198.177.219] (90-226-0-12-no2310.tbcn.telia.com. [90.226.0.12])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5536773139csm506477e87.208.2025.06.07.05.55.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jun 2025 05:55:43 -0700 (PDT)
Message-ID: <a2e94873-ca10-4478-bfbc-b22031bedbb1@tethuvudet.se>
Date: Sat, 7 Jun 2025 14:55:40 +0200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Finn Thain <fthain@linux-m68k.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Jean-Michel Hautbois
 <jeanmichel.hautbois@yoseli.org>, port-m68k <port-m68k@netbsd.org>,
 debian-68k <debian-68k@lists.debian.org>,
 linux-m68k <linux-m68k@vger.kernel.org>
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
 <442267d5-241e-44a5-9b54-fee06bc5c03b@yoseli.org>
 <9013836044f8bfb7f0cd62ba536f6a1c75034465.camel@physik.fu-berlin.de>
 <80f5c684-638b-4486-9026-1f8689a7f147@yoseli.org>
 <95e56d983ace4976143c7e1180ffe5606c0ee3fe.camel@physik.fu-berlin.de>
 <CAMuHMdXNF5OCjdK7+AHWTCqSEDa-n-dYdESVVSP5Jn9UqA6feA@mail.gmail.com>
 <d1d407e4df2b3558efd5769de746645823e73513.camel@physik.fu-berlin.de>
 <758f14d8-6d03-2aab-468b-170b0bbb7d2a@linux-m68k.org>
 <8e0186f61cc9bbed2373ae215e80ab7e70042793.camel@physik.fu-berlin.de>
 <87sekbq3f8.fsf@linux-m68k.org>
 <cb873001-0287-4a60-a793-07b553d92224@tethuvudet.se>
 <87ldq3ajsa.fsf@igel.home>
Content-Language: sv
From: Anders Magnusson <ragge@tethuvudet.se>
In-Reply-To: <87ldq3ajsa.fsf@igel.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Den 2025-06-07 kl. 13:11, skrev Andreas Schwab:
> On Jun 07 2025, Anders Magnusson wrote:
>
>> The paper copy of the "System V Application Binary Interface" for 68000
>> that I have here says that all pointers should be aligned 4 bytes (figure
>> 3-1).  Nothing else.
> And how is that relevant?
Well, were we not discussing the ELF specification for 68k?
