Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14663B2FC1
	for <linux-m68k@lists.linux-m68k.org>; Wed,  8 Apr 2026 10:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775642822; cv=pass; b=NCrWbwh73nVfSFw5WObBGIBMB7yyGLREPUfXpZDxwxYr0uZUDr9x5xgUqv83nhXoSF+WRCygQEA3/2ICkypriZkmPOR/pHa0DgaRzD3fM3A6BUfxj+HeGLw0zxxp4fdgiwqgDCLoc65Kif1qPO9OzCV48QtyBDhzo1JhRhBuisc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775642822; c=relaxed/simple;
	bh=NmfdlC+fOdbM062XOnISQnilH4sDd4VOk23c6LvwgyE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jleY5Q3acIpeH0sdLYERQIGEBItwLT/DYNtwiviUfYwrKS/ZMFSUmkICnfn+MiOUkm/aHV2aBhZzkRN8xcNMl8CgehCLC/yWocVy7wr1xGwAMdU9I8y5k4hvIULOBnb8zr8um/Zl6U+5rP1R9VPF276uMiViGRRVQMs/13NEPSU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=dufB8H67; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="dufB8H67"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-12bfa7fe691so215443c88.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 08 Apr 2026 03:06:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775642815; cv=none;
        d=google.com; s=arc-20240605;
        b=PbA2Fb4qgZAmBA2mnZVQ4S3RRIQRPBeySsLCY1vYjmD3ryvJKCv56ae6wYLKIcQNLE
         XPuhqhocZObJ/aqY4QYQA5MJQbNMeUdw+TCL6aw8Yt/8VsLxrY/RJihGdYIWEuMUCwIC
         UjCZ2Izlh1BhFhnHNm8hUEUZ6OGvYLRIMzYWUtTJ6Uks5Dwg2fBjHYj5cjdJTyJ+D1v0
         nsXocBPof+yOlGZIe1A4pvHlnd4WsmQ0zT5FxClRS5sqJJ8LHx3x8IBh/IuGXdfKxmwT
         F057/AT7t2bI8MX1Cf81RLU5WTUvhrxkxto+b1wT6yYQepih8EvJ+ksZTeC/42Jsd8BQ
         OafA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NmfdlC+fOdbM062XOnISQnilH4sDd4VOk23c6LvwgyE=;
        fh=Ybg35QSErELZWiR6GDPd1mBSLzAyPTtHdd365Lpxw2Y=;
        b=lTLNXl84B9obIWYrLuIlkp/5vApgPxGXywbgwv/M6nlp2i9np76AXxsx8EFK9g747x
         79c6ybt//dLP7hwNnoukx1lcj8JZuxWPLqrbg7190rpCqoecqqu+t7oDLZ1WzYwNxtGA
         WdxwuyU8EqzX91YnyTiWve/FnflG1inLMVSe0wJf90B7RRjhkz28qTQGevPYd+RIUlCj
         Q2VJ7xxKVIUQXlm97aj8Yp9VXc+1ITqaJ1/gj6uce3QMjgg87xVykjEkLV31MEwsWK6o
         KAagyvvgCSldwQelStNa07pLy5+trCws3jWgSkjJfUy0+auSsMgeWlWgpxS1BbapI9jq
         /AuA==;
        darn=lists.linux-m68k.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1775642815; x=1776247615; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NmfdlC+fOdbM062XOnISQnilH4sDd4VOk23c6LvwgyE=;
        b=dufB8H67VXNV3ukHJanmejCX5CeDbFHmNLjKHurnHiTn8JXDn1QnlW3dLjRlNL/85a
         wQQcr01C3iP8B3480yMnawKpHVYi/mfE9JkMPds7ttMRzuQmGJfW2ZDvj3F5SLd+YpiM
         pUyC6Ymv88pVhzQUKZz1MPPwMwrhdTcawOt5Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775642815; x=1776247615;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NmfdlC+fOdbM062XOnISQnilH4sDd4VOk23c6LvwgyE=;
        b=cPWHDNJEPRppw58vG21SV7AQNgikYiEAj72TkCD18Y+a0x5qVTB2851xMISgQ4q5kc
         4q1ysRbm+JQzdLTmbawodVh6bXXaVOjA/PL/dYbe+aKQZ4x8iisGHfDWtaQ4iqKhrzHz
         10tdOlgSLc2Z/8ySm29cfXNAcpAMqdO+1DbgiAjLbS81cQyvWzDpLIfRVilZHni5s/bF
         oxe5SMA3r91lJl5afiPVRxI2JhnkWJZicu6DNsaH8rLhGv58H2ip3xy4fhUaSgX/Nz1O
         eEbKekZYytvQ4jH4Dg6KSw7uGkTVwTKKXPBIBUF79FcnWwqJcsBIGUgeVTyrk4zu8a82
         /rkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgTR1bF8NFhSlZk3sVoCONXLFGpuXBK2PfspzveeL8UP0S46FTsk2N9WLT77WARWbdbU3dlCk/nV5e@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yw048sOfmIiYa6SvF/R7CyIZT1Z8/t28fT0SAVBBxsU8J8zeo98
	h7s3atS6L650Tt7v+Rgs7ZMsDMU0oKIHqIMf72IDqXVweGh01eP3ZTWyROLcnfybjlXtHvpS986
	LXlGjWIC6Eu+5qwZYqNH25zuaAanB5q/o48VzyyK8WQ==
X-Gm-Gg: AeBDietFmdetvxpr/z0c8pPQqu6rk5j2GNZwbwmVEhSfXigvOnHSm5tjaTyhJjlZWUE
	1rjFO0lemwWHf5/Q19QhR5zxqRpCjs/L4pqSQsTlIdDc9kSf2HmyQzg+woL6U5DLzYx6uSXiWoO
	KJQkWtPtHRGYHKB+sX0xMohfrrqKL+31m18oOjl0jiV1E56EjoQEzb+D8rfrrTVpF73w70FZqmo
	cJBqlD7weFg5z0BYc7+bfyssgfBQWjZ0jgh7MxDKKkUI1Q1gMBaAA1/v/jGl76QWbpeagvhaK2Q
	M1Ok4eRjUTARJQnxGaXwzQMIi3s6+1Ve51pFsyil
X-Received: by 2002:a05:7022:fe08:b0:119:e56b:c74b with SMTP id
 a92af1059eb24-12bfb708680mr11654025c88.16.1775642815160; Wed, 08 Apr 2026
 03:06:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260406172512.6693-1-pedratscher.stefan@gmail.com>
In-Reply-To: <20260406172512.6693-1-pedratscher.stefan@gmail.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Wed, 8 Apr 2026 19:06:43 +0900
X-Gm-Features: AQROBzBXCX5ZOSw6OfG5fa_MtCA5pJPHKM-FLrTQZg9vZh8ffgS_99bDEbYaN3g
Message-ID: <CAFr9PXnATzNhkg9DtJ6YEweEU7juaOOuH4QC2h9S=5iAK6AqMQ@mail.gmail.com>
Subject: Re: [PATCH] zorro: sysfs: replace sprintf with sysfs_emit
To: Stefan Pedratscher <pedratscher.stefan@gmail.com>
Cc: geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Stefan,

On Tue, 7 Apr 2026 at 02:26, Stefan Pedratscher
<pedratscher.stefan@gmail.com> wrote:
>
> Convert sysfs show functions from sprintf to sysfs_emit as recommended
> by Documentation/filesystems/sysfs.rst. This ensures proper buffer
> handling and avoids potential buffer overflows.

Build, boot and poked around in /sys/bus/zorro tested on my Amiga
4000. Amiga is still in one piece so:

Tested-by: Daniel Palmer <daniel@thingy.jp>
