Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9193FDB
	for <linux-m68k@vger.kernel.org>; Mon, 15 Apr 2024 01:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713144360; cv=none; b=WzWl79UdyDtUfPeGjyJB4qQato4zV8kqqWPVez6PrGx+oW0FxhyieR/srggJmTq9AEKXPg3nZRkKrmi1tm6/Nesd3wqA8MigzBDyJVbVgn1QlV01Cp35hFqXZXfstdIR63M6ZWQEeK0wgIbCSf2JsKRZ/zHFuVjcA6fn2zWqJfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713144360; c=relaxed/simple;
	bh=H3LLPad5ersy4HCSxUBDZXD2kIfapxNEMmhi4Sq5ISE=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=C6ALRyrFXdt4fk8Xi4+yZcQZGEr7PhXZrwxhyW6Dw/Kd8sy9lRiJTzz1GN0iseDT95DmsL/vMQLLsXo2F9aDSYpFnZDncst+X/nLQ9mh4l1MsoUsUtoeGu103JoSoSiZoHb5rsTjnLx+9yQWE5QxUoj5tX0aGSM+fo/fOMtyeGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zdzx+Gfc; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zdzx+Gfc"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-78d778e6d3cso245950785a.3
        for <linux-m68k@vger.kernel.org>; Sun, 14 Apr 2024 18:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713144358; x=1713749158; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r7EDetoFslckcjwoiPP8lUu1uy1OuXhEJih6ZoGEjNU=;
        b=Zdzx+GfclYQ2xhOGJ4t+BKod6hmreIyDsQj7i7Hz7XR4ajy1iRulO3mCAU9DFiIzpn
         SABnjwKzi+CQqiVNcHWNwJqUv1+DiSN2fQqVkfyOZxSKDLyUnISTiTxPSJbLSWa70hxq
         3kN3VZeFyDd1LryE3NenJLY3Oa0Iux15cIq7vt96lckl61TGVbcV+csxZaXap3ZyyTaB
         ulQDVZG4as5iaxb9WziXnNCkb6i5dztm51rcWC9gtXTLDLGrz0hkNk/KiKVxxLPBw5i9
         jEozf3APYiLtBGY6ret+dWJ0RQ3SvKqRAy2U8Gx14hGXQWJnT011eOadBNqv/2vxKPwm
         o3Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713144358; x=1713749158;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r7EDetoFslckcjwoiPP8lUu1uy1OuXhEJih6ZoGEjNU=;
        b=jTSk1+50655hZOXJZ90qU6mV4ETupeenASTJqLyDfTG4XJsypHYXtbyxqH4ekH059B
         WP/bqRuYhTk/3ASnPA8H5CY2wllXmPOoToQhSj9Q1F5tCPXBCHtTSAyHixcbpb9t3t96
         FbnRWjIHBcOpXrOoRuTjasRiXh6caZCQDIl8BZTdl2eemV2P7d6W96SWGO3Ny/gaeDmO
         e/JJEt8crQIoeX9lE7LYqaFdrpBtM+Gm6nMjd74jOIL0lv3P6a6IdFdbQxdZb8eziq2S
         WkU30fq6uzVyp/ZBqw/Rmm0kOx3YC7fIsmLJT9u+7ZAXJfJxVVdwAA01hfy/x80/jy9T
         cOmQ==
X-Gm-Message-State: AOJu0Yx8/9J9OCGxq+th4bVzIP4RBqAFrvHWccFLse96OtSmlA3Mv202
	O3W9Gh3R+aIW3tmnFIuUusM7OLeKVd6cceHUloNYColKhJd8n7Fj
X-Google-Smtp-Source: AGHT+IEUJgqB/dnXlDK4mi17a73+x8P08JuYLG3rR16r6jhwA0JUPeTHrJCW3IFuGuqh9e7GzXLBrA==
X-Received: by 2002:ae9:f70d:0:b0:78c:8547:79b0 with SMTP id s13-20020ae9f70d000000b0078c854779b0mr9623397qkg.29.1713144357599;
        Sun, 14 Apr 2024 18:25:57 -0700 (PDT)
Received: from ?IPv6:2601:152:4d00:9f50:241d:bfe2:774f:2bd7? ([2601:152:4d00:9f50:241d:bfe2:774f:2bd7])
        by smtp.gmail.com with ESMTPSA id f4-20020a05620a20c400b0078d4732d92fsm5657913qka.115.2024.04.14.18.25.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 14 Apr 2024 18:25:57 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Subject: Re: MFS Filesystem support
From: Josh Juran <jjuran@gmail.com>
In-Reply-To: <CAEgzAWxZOMZYSzsiJJxOAy5otCGBvOZe9STGdjkkzWZa5p3dvg@mail.gmail.com>
Date: Sun, 14 Apr 2024 21:25:55 -0400
Cc: linux-m68k@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <CAD8FB7D-F3DD-4A0B-9388-EF88FF52CED5@gmail.com>
References: <CAEgzAWxZOMZYSzsiJJxOAy5otCGBvOZe9STGdjkkzWZa5p3dvg@mail.gmail.com>
To: The Mariocrafter <kayvonkamyar@gmail.com>
X-Mailer: Apple Mail (2.3445.9.7)

On Apr 14, 2024, at 7:07 PM, The Mariocrafter <kayvonkamyar@gmail.com> =
wrote:

> Macintosh File System (MFS) is a filesystem used in early Macintosh
> models up to those running System 3, when the original HFS (which is
> supported within Linux) supported it.  Although no Mac model that
> shipped or can run with an MFS-only macOS can run Linux, floppy disks
> formatted with an MFS system may still exist and the user never
> bothered to reformat it to HFS or HFS+,

Mac OS never provided a facility for formatting 400K disks as anything =
but MFS.

> and the main use case I can
> think of is using MFS to transfer files from a modern device to a Mac
> that does not support HFS.

This would require a read-write implementation of MFS.  By the way, are =
we talking disk images for e.g. Mini vMac, or actual 1980s hardware?

> It would be nice supporting the MFS
> filesystem natively within Linux, which could be read-only or
> read-write.

An alternative to native filesystem support is to read and write disk =
images in userspace.  Aside from not increasing the kernel=E2=80=99s =
attack surface or imposing a licensing constraint, it has the benefit of =
being portable to other operating systems.

For example, I created a (so far) read-only implementation of MFS for =
Advanced Mac Substitute[1] (an emulator plus reimplementation of Mac OS =
for running 68K applications).

https://github.com/jjuran/metamage_1 (see 68k/modules/ams-fs/MFS.cc)

If someone does seek to implement MFS, at the very least you might find =
the comments useful.

Cheers,
Josh

[1] https://www.v68k.org/ams/

