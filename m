Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2429286333
	for <linux-m68k@lists.linux-m68k.org>; Mon,  6 Jan 2025 15:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736178709; cv=none; b=RO5PvBXpeWCy8lfTTFOUpOelhkTmCkzz/Z9/J5rFPeRh6+GD/wCM70pIWMP80cVOLhmoXZTs5rpZOAupZ/CvgLH91D0VMe3TwKq/ODXQB7bkYS0VnUSahY1CDZGfveTjaoOT1TGO4lcmC5NsEI4F2grAJ08Ys+HGxLrZVg8coPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736178709; c=relaxed/simple;
	bh=j6/63r2h9KWpkhgTaeTyfLc0JiKry9wPjGgkywCR41g=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=a/Lf9d8i2orYQEAQE1ZR65Ory3eYpkGAIZjm18wHc1sibM1vxNFsksGOpmraJIcWZ3O9PhgxmO59ooiCLKaIJZo4lKx5XbEI3YGo6uz2fpGQ5AUbf+arJGvA7qSRT5TTkkUvg2ewXSw+LrIM7Lgy5cs65KvyGO5haeyFrfyMsHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tp7nMufK; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tp7nMufK"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-46769b34cbfso37480101cf.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 06 Jan 2025 07:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736178707; x=1736783507; darn=lists.linux-m68k.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WHDluD7r4ZCMvjPqMA7yz16uaks4UJvI0wD0/N0YwM8=;
        b=Tp7nMufKGovpSRlGbLAI+nv2ZT57PWCe9S72PCOGzN/WooCsCMA/nqhIuaL95CRQBO
         DcLbizdpvq+9kE9wTju9o5yDq3zHG5ImnGm6JTSetjKR6zuLt3gkybC/gVQqx8tsDOcw
         +IcacHApJ1UsZtGaUb2XIM7VN1tMRVwdnzjBksRdZBSBd6Y7oc1PHmfixGH5KoXGccLh
         DKWMhscoQN3XyH8KkIi9eZ8RObTq3SYSwUox4NjJaDBu4h9VD43oxr+e3lNwPi1CbZkK
         YAbMr7tBp1N6pgyNagXPTTVsCAzrxTkmFgZr1PZlJJdqghCRNgqcxiKakISI+97qukJ2
         GBpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736178707; x=1736783507;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WHDluD7r4ZCMvjPqMA7yz16uaks4UJvI0wD0/N0YwM8=;
        b=FahDlYaDaJh5hjDTGsYtZKYpAQtwZAjVOXlrLoWBfVgnwyfLhQ0rYIQtgE9Gt0/Yic
         n1J2JH+Qarkugbyr+QBa3RHNhSYc3FFxjcgrFBwvd+AWvjLz8ZdH7LBqJIxKIsyT+ZUi
         7zwwH0dQmhPMC1W2NqK9CdEFBjPTmNdxsoerKDPpJCj3TNtToyYjM1vTad+kIGE+uOPP
         +rlUDtta6p4cTGMmMBhlHPRyNgrcfFnyx4khnHFjcjTxAizVFv0JZQqXTghQB0Dv4NHB
         GFxCFM3W4rFbEZLtV9QGs0LAn6sdl5EglD6CXNL9XiLgrWFOnCkQafx2UyF2NDRjg0S0
         av3A==
X-Forwarded-Encrypted: i=1; AJvYcCXSn8PxsB29K3dQWUG04FSvoRwNwPdnOz85wARfSVwo9LhLzvSjy556cBSVXYbFTC99ujUtWezqGbJq@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yw1TTmzryFKbPBmoxaiBYwhMGilKJGQrekCsZ/P4kE26o6BvPGb
	yEY7WMdYvahvEpD7YHWanyIt6IEtSfni8ZYeT2DcemFynIYl/ZnF
X-Gm-Gg: ASbGncuFlRSaJGlK26kZhNJX600TjJtDOf1Gj5j70OAETSWH7xd1XkfJzPFUsw+KhAG
	jQKa1bdtOOXDbjQIg86k0wasJ/2cp1bFIDW3E4wOUvrc3cfPRFSw+GuWhZ8TGBWhpb1TvIwiDWi
	alUAoR/Y5vA3lxlu5P0ffZomZPc+jvSN19pz0L9eE/5p+D+wO+MSZw4zhzLhmJu5qZSDonoAwh1
	KY39nZEbhp4Ow2i206w29CG/azPhNpXhDXxnyTtv64z4bTnnEdAg0pJ5JXZWcD3JVXoJMVfDF8L
	AtM=
X-Google-Smtp-Source: AGHT+IEQ4MCZqc3QlMYuN7AWoHzyWfjdDwgWkOjJGH7CdvTAF0HOXSePb7EdFz7pyA5xoP+QeGRPtw==
X-Received: by 2002:ac8:5916:0:b0:466:a41a:6448 with SMTP id d75a77b69052e-46a4a8dcc66mr856844201cf.18.1736178707125;
        Mon, 06 Jan 2025 07:51:47 -0800 (PST)
Received: from smtpclient.apple ([2601:152:4d00:9f50:304c:a44c:5040:a009])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46afc4597d3sm59810761cf.50.2025.01.06.07.51.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2025 07:51:46 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.15\))
Subject: Re: [RFC PATCH 0/3] m68k goes DT
From: Josh Juran <jjuran@gmail.com>
In-Reply-To: <4eb796cc-b178-8394-0149-03600f1caaed@linux-m68k.org>
Date: Mon, 6 Jan 2025 10:51:44 -0500
Cc: Daniel Palmer <daniel@0x0f.com>,
 geert@linux-m68k.org,
 linux-m68k@lists.linux-m68k.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <B5B5D58B-D111-431F-9701-44FCBB67D11E@gmail.com>
References: <20250105071433.3943289-1-daniel@0x0f.com>
 <291d1541-e026-cc50-6a55-42c11c64b6eb@linux-m68k.org>
 <CAFr9PXm4kTWF27GPMNDb5=W8vZRQia418xOQDF_X1yo0vwn6hA@mail.gmail.com>
 <4eb796cc-b178-8394-0149-03600f1caaed@linux-m68k.org>
To: Finn Thain <fthain@linux-m68k.org>
X-Mailer: Apple Mail (2.3654.120.0.1.15)

On Jan 5, 2025, at 10:28 PM, Finn Thain <fthain@linux-m68k.org> wrote:

> In the case of Penguin, you also need to know MacOS internals.
>=20
> But these bootloaders have bugs, like any other program, and someone =
has=20
> to maintain them=E2=80=A6

If Penguin needs maintenance, I=E2=80=99m still here and I still develop =
for classic Mac OS.  I=E2=80=99ve ditched CodeWarrior=E2=80=99s =
proprietary project files, though I still use the non-free Metrowerks =
compiler and linker (but now in MPW=E2=80=99s ToolServer, driven by my =
own build tool running in MacRelix).  Lately I=E2=80=99ve been using =
custom post-linkers to improve startup code compatibility with older OS =
versions.

I=E2=80=99m not in a position to do testing on hardware or development =
relating to Linux bootup, but as before, I can maintain and build Mac OS =
programs.

Cheers,
Josh

