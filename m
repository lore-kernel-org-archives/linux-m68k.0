Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF7F1756F
	for <linux-m68k@lists.linux-m68k.org>; Mon,  5 Feb 2024 10:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707129811; cv=none; b=hLccifJ8Q4jArgliXdYaTf4Jn1FGbXKcR/Xi/p5txK3HY8Huh7C0wdAXaOFzVugnzwPK/vev45c2mrtzRizLWEf0KobHJT+YYYYsV3D8vm4qRihgtcM5VIYc/ahlR9IAQKd2X+2NVKvY1ih7e5rNJ4qrdb2Wq/vTuuc5dqGBPd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707129811; c=relaxed/simple;
	bh=wae8WXBpMrupkMu8qpekTMb7NwMJ3LJZiULn/omIxyc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ldzd1WWixzo2iHUaCOtW3SB2HyAGEUm+uYJXU4x0mfKUv7R9ifDJAbZlRJysWKnLptaGbmulCSbS4garj/gPM7mn1s84kJk42JxipuvQXjtbckI6wuKkpZcLdHu6yMlLaD2Io8OBHRwhJmZ7W5U1lnHg//osvTdoX3Jb1MInRF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-5d8b276979aso3209824a12.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 05 Feb 2024 02:43:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707129809; x=1707734609;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wae8WXBpMrupkMu8qpekTMb7NwMJ3LJZiULn/omIxyc=;
        b=ooNDLF8apBnkHmPp8krir/Mb6Ux5spCs18e5Tb0XuFJ7Y+0B90BLgnPEByTIuG4n8u
         TQS0/TyP5Eey/H9GdeWsmhgI1rhaJp3wVemefTxmjfsL9pUJkhIiNfQuenQmwappA9Ch
         55Hjx7yP+JEcjJKhTo5SBQkMMIxKLnV6kSeFMPokH1tBTx88qydTEAJaasu719xsEZYB
         jWezmZ1352/8QYb1lDYYDJsjWOj0G1YmpRuntjMW96Tv1thSktyww2WRMGlpLxaNi7VO
         ORnAm1l1pbp1HeKi0qK5DRYZNOpFCSMbHlW9zX5saWWBgYo4ZcNoD5VjiV7QLcJ/6WDx
         X7sw==
X-Gm-Message-State: AOJu0Yyyn78nzGMD2hfNyVDWT1qIyqFuev+CJGnPPQjs0s+b+Ft0YB6s
	RV8dDOFQuRH8v4nlUXNjV3WgBSZivU3CmUl3XokFwmOfhROdV4lMhGxlmpflj0OmEwH/QDrS08y
	AQhFFtRpQBdSOzkU9qOOE3IjLVA4=
X-Google-Smtp-Source: AGHT+IEZkP2aXwQYrTb/2HJ/EM8D8sip4YfOLpNrFda2aTlFYqJq3PTNElTnnP4OMdKnmcmwLl3lg1hHXDWOdaRufOU=
X-Received: by 2002:a17:90a:ac0c:b0:296:b8e2:b836 with SMTP id
 o12-20020a17090aac0c00b00296b8e2b836mr4468pjq.4.1707129808884; Mon, 05 Feb
 2024 02:43:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20221111081316.30373-1-mailhol.vincent@wanadoo.fr>
 <20240128050449.1332798-1-mailhol.vincent@wanadoo.fr> <20240128050449.1332798-3-mailhol.vincent@wanadoo.fr>
 <c47fedaf-cdc9-f970-460f-d2ee7e806da4@linux-m68k.org> <CAMZ6RqKj207uv5AF_fvb65nhCM32V=VAQXsUGLNmbeXYKPvZJg@mail.gmail.com>
 <9d9be9dbe92f43d2a95d11d6b2f434c1@AcuMS.aculab.com> <CAMZ6Rq+RnY16sREhAZ6AFn3sz1SuPsKqhW-m0TrrDz1hd=vNOA@mail.gmail.com>
 <77831c6f-7fc9-c42d-b29b-c3b2f3f5e687@linux-m68k.org> <CAMZ6RqLyRxvUiLKZLkQF1cYFkdOqX73V2K=dGbNROMDj61OKLw@mail.gmail.com>
 <002675b0-6976-9efa-6bc5-b8bad287a1d2@linux-m68k.org> <CAMZ6RqKx=EO9kcOmxRyBuhULdDyTCeAXz25j_uF7TSy72Jahpw@mail.gmail.com>
 <00a7e866-23ff-fc63-b6df-364580f69c78@linux-m68k.org>
In-Reply-To: <00a7e866-23ff-fc63-b6df-364580f69c78@linux-m68k.org>
From: Vincent MAILHOL <mailhol.vincent@wanadoo.fr>
Date: Mon, 5 Feb 2024 19:43:17 +0900
Message-ID: <CAMZ6RqLkCPuy+mQxp0HuVBgfSiFgFOwimYm1Ro7ESANyF-fRyg@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] m68k/bitops: use __builtin_{clz,ctzl,ffs} to
 evaluate constant expressions
To: Finn Thain <fthain@linux-m68k.org>
Cc: David Laight <David.Laight@aculab.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Yury Norov <yury.norov@gmail.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Douglas Anderson <dianders@chromium.org>, 
	Kees Cook <keescook@chromium.org>, Petr Mladek <pmladek@suse.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Zhaoyang Huang <zhaoyang.huang@unisoc.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Marco Elver <elver@google.com>, 
	Brian Cain <bcain@quicinc.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Matthew Wilcox <willy@infradead.org>, "Paul E . McKenney" <paulmck@kernel.org>, 
	"linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"

On Mon. 5 Feb. 2024 at 18:48, Finn Thain <fthain@linux-m68k.org> wrote:
> On Mon, 5 Feb 2024, Vincent MAILHOL wrote:
>
> >
> > This is why I am asking whether or not clang support is important or not
> > for m68k. If you tell me it is not, then fine, I will remove all the asm
> > (by the way, the patch is already ready). But if there are even a few
> > users who care about clang for m68k, then I do not think we should
> > penalize them and I would not sign-off a change which negatively impacts
> > some users.
> >
>
> If clang support is important then clang's builtins are important. So why
> not improve those instead? That would resolve the issue in a win-win.

I am deeply sorry, but with all your respect, this request is unfair.
I will not fix the compiler.

Let me repeat my question for the third time: are you (or any other
m68k maintainer) ready to acknowledge that we can degrade the
performance for clang m68k users? With that acknowledgement, I will
remove the asm and replace it with the builtins.


Yours sincerely,
Vincent Mailhol
