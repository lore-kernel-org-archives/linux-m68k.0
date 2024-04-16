Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B1F12C539
	for <linux-m68k@lists.linux-m68k.org>; Tue, 16 Apr 2024 13:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713274487; cv=none; b=rfGNGtxht7OWCArP+nGVwsUb7Acib54bV3D/oP6VpmElaUJqb2kIeXntE+LsI/oS3Ud55Irxmqtp2W3z9w1MOy969xBGFZhm+FGmFfNsZFyDTSmig0l6KQIFHIPVCWt+Rh+N2HF0ZUduT9388QVLmcL4v1QrnczHJzf4YeZoB8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713274487; c=relaxed/simple;
	bh=x1iSeR8brmhtLjIDUSCjuInatEabzV1f+Dkph9dhVIc=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=GQJp17T8tDOjq+MTGc8HQkJP6JmYHwOMc2UgI+pn4s8ReVdXVfoL5JaNssTpT/MIIIhMwWowkhA7t8JoMDBhqFn5hxQtB0CoyhH++WSK0Uf2pegjNwe3OlOTH5CNXWt45hpsUugqMyTHikYUEwLjXskN50mt3mThthV4+iHVvkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com; spf=none smtp.mailfrom=toblux.com; dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b=mklEb4A2; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=toblux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="mklEb4A2"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3465921600dso3922246f8f.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 16 Apr 2024 06:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1713274484; x=1713879284; darn=lists.linux-m68k.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JSpasVcLTZB70Sav5wxRhPBNp7m2qZ1ZQk9+abC0XXI=;
        b=mklEb4A2jlsfzpgqOwP5dpeOrNWg13YkvN0zcMnG4szP1HEoF9G4OeSwnCu/JohOos
         gUvJCqJKa9bjBGMZI6Bf07smHqH5R+tNQZf6O3rWr3Ykh+eGSm5zJdPBXkyOkaD8C5Mm
         651oeCzRWoQl2tLT/o4b1ma1t52/ZfFPmLhvhcm07Rg6P8GZDAeEGJD5dW9ISsHfMT9o
         zvzlO4QfC4VWM8vyYZEVMvYhqmg9dtlA0UiSY+W//kGiQX5mrlDBBy3IXYXqoxviKM63
         aCauZiaSo8s+4TDy2XhNGsqOjmmsC2eh02bF4JU1GvnAyl8lOACYi7pdTEkXCFUQb3fx
         S5eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713274484; x=1713879284;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JSpasVcLTZB70Sav5wxRhPBNp7m2qZ1ZQk9+abC0XXI=;
        b=dEBTh0Mmo99JXnvY75hDRPBzvTBgWk4Khjnu0kvg3YCNxXOMR3cT7gGlMR4BriL2sZ
         9W4CetwyXCJV2xcd2Xu+doWY9hY07IPNzB+ySbjf5lM2AoNnuxU8XsxYlZQ9J7GrWZSI
         jVMYJBAL/yANulQs4G5TDvGqnPXqppgFLALxIUnVFScrrmv+Y5tc1SJa64CMSXnsaNCr
         6tDjL0Zg6fsgmax7bb0B76LSW0C2oSdZNny9rikUBm1uKgbGhhT/lZZpbZc4RYyy7u5W
         qe0AQdg4XhOnUYtWsV65W7d/QIVHykEF/lK0oHLF4Ff0m/M2y3cj5EPHZJ2B+Q2fRfa/
         4Wag==
X-Forwarded-Encrypted: i=1; AJvYcCWSxPKMLxhJ8OXeroLmPlraV2QezOLH0DlMtgk3Ji60IaHmlYA3tBqoRzV+o8S+xsaKVcSRbcREGUkI6JGdAy7FGI3xF56IpvdFI3PmZTRD
X-Gm-Message-State: AOJu0YyVB16jD8O0HtV/aSrYc0p6qBx8RXm4JuJAq8jDNEkAHzRhaSug
	ZT+gwZhFRRn4djyKkjjb2mdV4F+Mg9cemEBJRQdF3TxWRk4OHrjYVfPfBF6z/Gk=
X-Google-Smtp-Source: AGHT+IG2BFHksEcDc+5L6w6uK4ftspfgtCi9JVkjGm6DVx45WYw2pXqKslICcbg8N7gyBUKyv+7rmQ==
X-Received: by 2002:adf:e750:0:b0:346:ab3c:1753 with SMTP id c16-20020adfe750000000b00346ab3c1753mr7580365wrn.40.1713274483759;
        Tue, 16 Apr 2024 06:34:43 -0700 (PDT)
Received: from smtpclient.apple ([2001:a61:10c6:ce01:2556:9555:6b40:d25d])
        by smtp.gmail.com with ESMTPSA id cs5-20020a056000088500b00343a0e2375esm14977447wrb.27.2024.04.16.06.34.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Apr 2024 06:34:43 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [PATCH] m68k: bitops: Fix typo in comment
From: Thorsten Blum <thorsten.blum@toblux.com>
In-Reply-To: <Zh5yQ6cIK3Rw7O-I@casper.infradead.org>
Date: Tue, 16 Apr 2024 15:34:32 +0200
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-m68k@lists.linux-m68k.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <D0F415CA-213F-4A0F-85EB-26BED1B128C1@toblux.com>
References: <20240416122155.313400-2-thorsten.blum@toblux.com>
 <Zh5yQ6cIK3Rw7O-I@casper.infradead.org>
To: Matthew Wilcox <willy@infradead.org>
X-Mailer: Apple Mail (2.3774.500.171.1.1)

On 16. Apr 2024, at 14:42, Matthew Wilcox <willy@infradead.org> wrote:
>=20
> On Tue, Apr 16, 2024 at 02:21:56PM +0200, Thorsten Blum wrote:
>> s/Coldfire/ColdFire/
>=20
> do you have nothing better to do?
>=20
> Also, there are 37 lines with the word "Coldfire" in them, many =
visible
> to the user.  Why change just this one?

I only noticed the different spellings within the same comment while =
working on=20
something else. I neither checked the rest of the file nor any other =
files.

Feel free to ignore it.=
