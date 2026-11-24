Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795544386;
	b=EXZ47G3XCuPtKSooTtc965xy+22Alf/TVrI1cgfJda5QTKN5icFTvO4nk5LGE3IiuIAo
	 QnHrwCxSiMvaZolnTgf1q/mVCM5xZqI0Cb7RVfxqsQHMJEMbbnzDcAP6gSqHzwm2KSuvT
	 vo0CdeZ9uS3hXbm15xZ2ik5dRH2AFfb44cpYCEHDb6uwkAyI1CLAFDk2ZEX99eB/aSIRw
	 fdkMpaLUTkWhJVf1gpIpYk/oQp5JIAOHBCliKOOAvDAWlcYLfYnvIWhXHk7eIMW0HaYgG
	 MCK5lXj5OXtK5cp2EiMerMwwf/BM048BfncrFy83QZeivnp5uGuFfYP/tEv35OUbUyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795544386;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=9akaBTfF6wDI9oHwKMXEjnbhxpjEIU4hGAF8pqsrUb0=;
	b=vhxemoXDkDelz1jm6EIixkj9VSu4m6lyjanxCdgKMgMeXir3DbJdBlbuxzGGBT+ISL4M
	 y88SNPauh/OEOGV3u/ZBGyNAYrbbIo+PcKj2vI4UGETe9/wi5BR4Q3ywMfKkfMdcIN6Gm
	 xgU8rzHYlzATqfWFJzVU/X6Y0AHN4g60dJqXpiphm/uvuBF5WMHa9UCD1EOZkmsRHATCm
	 QzA9Z2P2J3Cg5gr9nEbBB55S2BCO/yom0vVkwcSHLBoyd9QefaQ59tR1ErQJVw+xev1bI
	 OsotwWdjJvp4QTlW0ychRyyFAen11ZUWgYiWJk/1YbCMXN2j4/ldgU7Q04JRDhamw6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H91mKLH7;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8656606A691
	for <linux-m68k@lists.linux-m68k.org>; Tue, 24 Nov 2026 18:19:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8656606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H91mKLH7
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b3ada81853so5626174c88.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 24 Nov 2026 10:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795544380; x=1796149180; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9akaBTfF6wDI9oHwKMXEjnbhxpjEIU4hGAF8pqsrUb0=;
        b=H91mKLH78XkLmRhMOGLwm89AAnIVG+wg6FTwUfqcoKcrCdR9SPbKjr5WcBgOosDbI1
         WMNnV/MKzQ1zkLTsLR8rIv3bJ7vTHXIU1WkIPnqYyUX/L04KY7JOJcmdma4REJ5cUZlP
         JhEVWxL9rg6EUG+DsXApzDJCOvzSBV1R7FJ5XqFTTQLO8fuwxAKYtncVoH+fz02a4mxu
         VkBkee953v/5n/B8CAULtDhrqPCiDhphXhJfuuutb8lxMhybY2qjyYa3LURdHlXeWjnn
         aKdA0iTvhgWmNpSvkhvLKKIjal57vhuEDWZrn3adUGYsrxEl6hE5nyBEl3wx3Ei45ZPY
         2zMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795544380; x=1796149180;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9akaBTfF6wDI9oHwKMXEjnbhxpjEIU4hGAF8pqsrUb0=;
        b=0jeVO8DdXJnCbiPoTukWmJdy4RIRSdQI6UTksP9J402kSJeMLvFeTLsGGhHH9XklQE
         hka4BUY6GrH01/fp2iWdPayi6qayj77TJ0/lT6WjJlAQJLAo06RrRlqU2HhHwpcQ2scl
         YYasZ7xCQ3MpJHl/2bxRugi3+FmVzxmxeJ08IMNt0M7CrriT8jF9S1fdutYOHh0T0Cju
         7F9fnj1OVFmjeBJiZw1zZOEKgDf23bUDMw0o0EHrFUTpFQX51A2iXC7WYlxbwm32YHef
         m4Y6XRD//vYfc/AvtiZHQyNmGWN7///sbUdZNQ/bVZXYEgjliA15wIHYJGMcaycubXng
         6zgw==
X-Forwarded-Encrypted: i=1; AL+hErGJY4IkUWZNrEcpJTIhcRlJFGpZBu2L6IKerCuYMuA+jGgQLVLlgn71Z/DUv+wTDBRetqpLEekPqLCO@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z8sZCE8lVXaPZbxaD0Uc274azJUtuKq73oajVkKUEuJ5SopDdMz
	/ApfVMZbQuWH4gXD5l4URjun6m+ppszV3aDutmikHl1ETOIlJ7N9WVUL
X-Gm-Gg: AZFdTZfff8Hzyalxf8ffoLv2kKLEKDckj1Nr+vJjttMpjlyb7Ax4x6afC3T5VqYMJwW
	scJgLZscJhB9W8R/6CpWtpvnqdoMkXDmh9VKGRQDGWAKpxQWQGFNxp6q9KTS55TBs1FS1MwuuH8
	Sy3kONHM3S64xvp5l5GzH0vOWU9KvJtQzzsw8wycnuU1hZq5mJmjUsUOqy7eFnU9jxx8nIPwKyJ
	kUTwZFwPajtqE38TNhcWUvmqRvbMDQACqz/k5rQzdJ7eCwjf0K11MHIW8gXdtT23JRbEz7BXx9M
	T3Rz+biwVJQZHKmGUBpduowlZnxzbxQXafrqFGX+aurQkUvX+LrPjHU7NOhO1aePHh7usmM8eqM
	jt+7gXTmgoRUzD2+kpjMpV0XI/jCR5rx+r5nKyxZWzQ23B52I+lQS8WZk1nhpp8h84MQeYThzMf
	H+EXB3lY05ykwC4zlqjDNiQ0GJF1nAp3EWKJKZ4/JfW9WzqDxkyfqMuCE97Puv3v6V4LAC5/lZB
	8SDwAOAnWXguUu1puMWtZdc1q0+kOOtvm0ZFtXTH4PfjsWYSmw++Tb+XmHR1FwD43nIG+f4aiOM
	W/ng775e1biQ72lCiGu5S9iF6VjEOAWXSUv5MkqYow5raK1hJNnlFiWBfp0GVBlE7MlPUOQ=
X-Received: by 2002:a05:7023:e41:10b0:1b5:43f6:74ee with SMTP id a92af1059eb24-1b5567c1250mr13792658c88.1.1795544379818;
        Tue, 24 Nov 2026 10:19:39 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:ee3b:b892:771b:3bc7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm59688327c88.9.2026.11.24.10.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 10:19:37 -0800 (PST)
Date: Tue, 24 Nov 2026 10:19:35 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Daniel Palmer <daniel@0x0f.com>
Cc: linux-input@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: amimouse - Fix the buttons
Message-ID: <awXVMoykw0uYsIsO@google.com>
References: <20261124100604.2380938-1-daniel@0x0f.com>
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261124100604.2380938-1-daniel@0x0f.com>

On Tue, Nov 24, 2026 at 07:06:04PM +0900, Daniel Palmer wrote:
> On the Amiga the left button is connected to CIAAPRA bit 6 (/FIR0)
> and the middle and right ones are POTINP (called potgor in the code)
> bits 8 (DATLX) and 10 (DATLY), all of these are active low according
> to the "Amiga Hardware Reference Manual (3rd edition)":
> 
> In chapter 8, "Interface Hardware": under "Mouse Buttons" a 0 in CIAAPRA
> bit 6 means "switch closed", and under "Digital I/O on the Controller
> Port" reading POTINP "will produce a 0 if the button is pressed, a 1 if
> it is not".
> 
> Invert the bits from the registers so the state of the buttons is
> correct.
> 
> Tested with Quake on a real Amiga 4000.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>

Applied, thank you.

-- 
Dmitry
