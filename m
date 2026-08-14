Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6E43E00B8
	for <linux-m68k@vger.kernel.org>; Fri, 14 Aug 2026 21:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786742811; cv=none; b=VM8otTeJGByeDsXFT4I4ESPNpYQ6ffWVrs8ZWSn+AeXaftUPu6AeZiJoHV4Yc3k99GTSkUIJ9JK5YZ7uKV1fMI0xBwzXHiZLfGvTNkTGWh/gHCmchbAjm3/3ek9XjlYyCTCw1ns3SPfS8WGmowY3Vd6BU20bVoLxBiIyqPYQWak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786742811; c=relaxed/simple;
	bh=Gm2ZGLMxM0N827AgEKo+n2iidCOI+bz+rjKWZ8Uu4A8=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=rTKgr+azJ+HAAELKsNpcxcbpjpWVfw1Si2DUjUkZ5iRmoYmpcmkpDU2i8vBRX3sH6mBrTtH99ux7oOhHrpHQ4ROPDlGI8xewQBJKDjfdWpU1KrnJVDCKsqrlOdE5b63h69dvM26zxOoajrrbXY+aVYasvtjZnjcmT59TyuU9bdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FounIUMc; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FounIUMc"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso16573425ad.2
        for <linux-m68k@vger.kernel.org>; Fri, 14 Aug 2026 14:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786742809; x=1787347609; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:mime-version
         :user-agent:date:message-id:from:cc:references:to:subject:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NXBjRScvDNcKNqsOAr5viYZMcqFSgPTmbvpw3sZgv3k=;
        b=FounIUMc1t/h8loriVdbGUPBVCvP52iYNPxJs6LpvaiU42d2KnDspajFGfVfZCEawN
         a5o1x/EMxd8PtdnCNWHB/ZwIJOechOeQzGfE0l/d1ouGen1vuETWzdq5IfvgcEvpelzf
         LDIzKRvADU3VIme/ZxTsQaBdDsdqF7hWUUm5XtodUYmP3Bg5mdPXmG5qOfjqUo5/Efzs
         8O2fizOU48oJwGuNxYzLVb+7qLCMXx5HxwEaLpSWBpFGoJ6WNZZzVUxmQ2C7Aqu3lisa
         eiNb6/0ZZE42GWnCuh4axz2q49Tvj1SkEefNxg0YF3PFeW9J1rXO7lAAt3oCCtZeIjR1
         UZdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786742809; x=1787347609;
        h=content-transfer-encoding:content-type:in-reply-to:mime-version
         :user-agent:date:message-id:from:cc:references:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NXBjRScvDNcKNqsOAr5viYZMcqFSgPTmbvpw3sZgv3k=;
        b=q/q/h4g8J+FoL17eKZbZIjEDXj4vsdXjKqw1eaa926c4GGVKbMo8iu4V6Fz6rrVgTj
         WK6hXQGTh56Ztwqamb8zKlhu/F4QyH/EZbyC21GtWw/HglFv746U9bI9dZr3CjcmKc39
         qv57vPiTX8uD2FJIEmEXiLXsxwiQxlGoC3CVelzJWmVpZA0kvnXDkwaDjISQblTQ7eRh
         OCN3b7s9etmntS5J8dJN/8KyuZU7zq1UVTGP0y131dd1668hPOZC65owDgdbvEBNF1hV
         nbd06lcfmF75zpRJ7AbljL8uGySpMNTdddW2DVa99a63dAHjf/wiZ/25AIqMkYrir4Nu
         jrZA==
X-Gm-Message-State: AOJu0YyoGhmqbo2JezDlQBzRnylELxTICDagdvSmDFobZB/Y6NXrKl1e
	lvbj/oQ1SOQoB73dvGxhe6MO7APRBIgfcdMN/qdPZ2LiDfrxc7GFwj5cXgfu7g==
X-Gm-Gg: AR+sD119iIp/8A/ordmg+hbNvUsTT1QHzCS69+CIMCycFmpE8LaBtUsj3hwHoUob6rD
	JoL6BpllrEiSJH5xEjl1ORXCOAxqqcLrPrvC4QpTEPNp5z3Kfo83M1tQcVZlUVf67PIOvgfDVO0
	xMKhw9xprhsiIUM0TIP7j6c5c2y7QUCYTw6/Y4wvFz3WcWZxgG/w29iemA2MjnxAm5q+pIsarLn
	GpBeRw7MlnMI4dFoifd1iRDY+CRhRVrZHcyVSitegVYMnlCGZuUQ+qVBe4Lzlt/1O0vBpQsBEmO
	no4QsRM6wQJPcKvzf+wf2lir21ji+qiYcP71S02XChMP1/DvGsT3rliKCLVKnsi++NtrzINxwjY
	14fXuAZp4gGMHri5WHznHgqPyhRsMUN6SJYxcP0hFODIiIiaWgZru3vLBTnag9Le5t5fPGDVpKH
	WI3AEM0xB91S42qewLmKoGdqL16WLjur7w67lMdR0IZI4Li4aMVd8yWLj3RtUCQz7hegE+YalFv
	ciPxkXE9VDXo2RbPlc0Th0x
X-Received: by 2002:a05:6a21:10e:b0:3bf:7994:ddca with SMTP id adf61e73a8af0-3cc71d5074cmr10877659637.29.1786742809208;
        Fri, 14 Aug 2026 14:26:49 -0700 (PDT)
Received: from [10.1.1.24] (222-152-170-159-fibre.sparkbb.co.nz. [222.152.170.159])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141388bd5a7sm16049580c88.15.2026.08.14.14.26.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Aug 2026 14:26:48 -0700 (PDT)
Subject: Re: [PATCH 5/5] m68k: Add support for Svethlana
To: =?UTF-8?B?TWlybyBLcm9ww6HEjWVr?= <miro.kropacek@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
References: <20260814031745.17140-1-schmitzmic@gmail.com>
 <20260814031745.17140-6-schmitzmic@gmail.com>
 <CAMuHMdXQJht5SZf0b2C-=dhYk9NTFZoQE_vKmptE+=TS1w=ZWw@mail.gmail.com>
 <CAN5rfbRTOVYdmAgC0MZxYeT4ofCQY4BSoW8fwbZnJ_amA=P46w@mail.gmail.com>
Cc: linux-m68k@vger.kernel.org
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <929bf60e-4e26-a5ed-6d3b-e40cf4543116@gmail.com>
Date: Sat, 15 Aug 2026 09:26:43 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAN5rfbRTOVYdmAgC0MZxYeT4ofCQY4BSoW8fwbZnJ_amA=P46w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Miro,

Am 14.08.2026 um 21:57 schrieb Miro Kropáček:
> On Fri, 14 Aug 2026 at 18:07, Geert Uytterhoeven <geert@linux-m68k.org
> <mailto:geert@linux-m68k.org>> wrote:
>
>     Does SVEthlana contain a unique MAC address?  Without this, you probably
>     get a different random MAC, and thus a different IP address from DHCP.
>
> It doesn't. I had to force it as:
>
> /etc/systemd/network/10-svethlana.link:
> [Match]
> Driver=ethoc
>
> [Link]
> MACAddress=<some online generated MAC address>
>
> IIRC the EtherNAT suffers from the same issue / feature but I don't know
> how it was solved in Linux, so you might do the same for Svethlana.

Same problem, same solution: set the MAC address from user space 
(00:00:DE:AD:BE:EF is a popular choice ...)

Cheers,

	Michael

>
> --
> http://mikro.atari.org
