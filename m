Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602E825742F
	for <linux-m68k@lists.linux-m68k.org>; Thu, 15 Jan 2026 06:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768457745; cv=none; b=MMoT4cooLIU7bvAZ90cHPMggoMdGAgpFqGucCNBuOF+iVU/+Ux3T90ZB44DRpsbkr+SoH6elA5eR/IaKaH15A8sZ/ITpisdipJ+TE4kODpyYnVM2XrZjwL0MjAMXV/pwoE7zqcN6BGvyKzyLe66vo7KwR5xfh7Lqhs2XVHZz2tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768457745; c=relaxed/simple;
	bh=xuYDqmlOXdV6M+f9LMPEInQe4YGVV3/NVgJwk7BAxnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u9U06sU6WPD7FRfAsjd90sHcBpmslWysebrxuJNrydgq7C35HPMpIB3I0lgBIsKYXWBdO9R4NxfOSSdoMEb232ILzT10KCaJFSiQ7jLG15rU0Owlw2dfk8TSE01VSvsxYuUPet/wZRmA3Qq2PWlItYuOtaf4Ba/mHMYwHJiCPn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X/EkValX; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X/EkValX"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c0c24d0f4ceso228533a12.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 14 Jan 2026 22:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768457742; x=1769062542; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LjxQx55L3HFhzEsrPSzupy5cs4/k1InHSQSDwivVXVQ=;
        b=X/EkValX2iXv8JTW3QFebAk/pCBY1EecWoF5XNvX+kPze4e+4oqRKDqXNyTDEZvQA+
         hYkuysQoYtlcivXaO4EjNn/ZvLkJUJera26J2BnO7AlJIb5gWsDtFqk/VUuS3ZBAkPRn
         Z/B/JEQknqGd51uL+AhM/ga4zz2VDwmRRHQ91THrek7z3ynUBgshvWW3LdKwhrboc6ta
         ThDLWe4SDoG6Tb8b3sR/OtQQ3nS2VG12+MJrTHZ4w1xnRB2tRihD25B+r99DbYqSCFdD
         tTI1K4LDHpdHZ/IfwSmQzyz1SLphzvI6hF2YJKhU90EARo2fF6yymhTb/+e0bU/1sbTW
         RLtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768457742; x=1769062542;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LjxQx55L3HFhzEsrPSzupy5cs4/k1InHSQSDwivVXVQ=;
        b=OJTKdMfeT5ctkHx/es3DsY0VE3s/vVfLTo/9WqXufJNw6XitddMX8vsQcAA+qWGXBE
         y9wpolgSWo85bjPsiRdAtpOXSf9OBDZvl7TJwA/jCw6j6yhEuFlh/kSDWKgnWHxGod4W
         LE9aREStCVQ2jUZNWHPomda0VMAbv9MZs2qSZ20DUlG9zDVpZj5u+H5bTvge+2aqgAnu
         CnstIprHc+dTf4xIwU/QIk5A1DuJGu54FOEultfDCcTEbFQ84MGijqedCsyw63fUds6l
         gSLhDbGGxEzc4wkaadAgye74Cx0V4rkGBWMIzx/d41uq1Tp5zL3GVRq5SiqcFQr5uk+V
         bscA==
X-Forwarded-Encrypted: i=1; AJvYcCUTjA6DW2p4W5BAYxkFW2BvSPdpSzTiZQLqy7ls/V8DrAxfkXPdSJW9yrm/i/1Zv1Ovzp0vSJKTGVlD@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yxx6KFOV/ZduivacqYas/Hpj0ii+3roTYAo4CcyBvCpeuzGq1iC
	ct4lsTR8OdK0miSo3psUbhBc/dCHBSa9UcTWRMC6Eh4Lfggr8XOzENkd
X-Gm-Gg: AY/fxX6pYpAStyzRoq1TWMGoF9PbxV3YrDxV+XNuiPScAjrwyHl9RnwrH5WgazbaxET
	oZlnDodO6tlt5pDmnCglSkuCUjrZskdfaa4eDL364kdockeBCVZyFqLeO5DFCa23hFf7agEy2HB
	NSzNggCYU/29Ts4oi4zNA1mzOY6n1lxW7oGS1HTdzz3Zg2o2srKiRLyUUASl7xcQFMXVkzDANPc
	i/+zrmRS2E9DsEyHJKR5TBoCv4OP3Dkl1U4WMkJ+3nL6UiC9sJDVT2qtPEYjQruuzcQct2qib3L
	PnHsFFOni82ycr5PwOjccb0AOFAXgzfJxZ5hfjpG4CzmqA7YAGpBVKKGgtZ7/LKX0VEZiGgmm4B
	L6XE6u6pNcdpIICBjyX1XpKfzA8D5EKb6+DDlVD5zer/mER0hhErGDQzQ26CsXNGu7BQxsa4rij
	Hfdnq2x++YrIDm35f75QkvFQOM
X-Received: by 2002:a17:90b:350b:b0:34a:8c77:d37b with SMTP id 98e67ed59e1d1-351090da11amr6037803a91.16.1768457741930;
        Wed, 14 Jan 2026 22:15:41 -0800 (PST)
Received: from google.com ([2402:7500:568:57ed:f859:ae8b:d60b:53d6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-352677ba62csm1059931a91.2.2026.01.14.22.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 22:15:41 -0800 (PST)
Date: Thu, 15 Jan 2026 14:15:37 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Daniel Palmer <daniel@0x0f.com>
Cc: geert@linux-m68k.org, sre@kernel.org, jserv@ccns.ncku.edu.tw,
	eleanor15x@gmail.com, linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 1/2] power: reset: Add QEMU virt-ctrl driver
Message-ID: <aWiGCY4aEF5dZOqY@google.com>
References: <20260112182258.1851769-1-visitorckw@gmail.com>
 <20260112182258.1851769-2-visitorckw@gmail.com>
 <CAFr9PXn9nzw=kmWqv_ZPZshhGuh0iAW5b=Csygt6WZOnmd2tig@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFr9PXn9nzw=kmWqv_ZPZshhGuh0iAW5b=Csygt6WZOnmd2tig@mail.gmail.com>

Hi Daniel,

On Wed, Jan 14, 2026 at 07:01:58PM +0900, Daniel Palmer wrote:
> Hi Kuan-Wei,
> 
> On Tue, 13 Jan 2026 at 03:27, Kuan-Wei Chiu <visitorckw@gmail.com> wrote:
> >
> > Add a new driver for the 'virt-ctrl' device found on QEMU virt machines
> > (e.g. m68k). This device provides a simple interface for system reset
> > and power off [1].
> >
> > This driver registers a restart handler for system reboot and sets the
> > global pm_power_off callback for system shutdown. It is designed to be
> > generic and can be reused by other architectures utilizing this QEMU
> > device.
> >
> > Link: https://gitlab.com/qemu-project/qemu/-/blob/v10.2.0/hw/misc/virt_ctrl.c [1]
> > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> 
> FWIW: I have a driver for this in my "m68k with devicetree" tree. As
> far as I could tell the virt_ctrl thing in QEMU might get more
> features aside from power control.
> So I made it a misc device instead.

Thanks for the note.
Just out of curious, are there currently specific plans to add
non-power features to virt_ctrl?

If new features are added, shouldn't they be exposed via separate
drivers in their respective subsystems, rather than consolidating
everything into a misc driver?

Regards,
Kuan-Wei


