Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC0D1F0E2D
	for <linux-m68k@lists.linux-m68k.org>; Tue, 21 Jan 2025 10:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737456433; cv=none; b=nsIX90SKfSprDORNvIvQ3ZMYQ0tQhfEg1+xc1OYcl724hGPHQauf/1X7BJUu5XW8dWwSaxyiWkpHRaQKZtWhdkovOHtinf1e7TwWRKX0x49Y+aOTXTKwrqxGusbENTj1dhgoM5QGmlPznCOfedC+27FP9jOUJ62Euks+zSlLNYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737456433; c=relaxed/simple;
	bh=4AHIzGFGSWv5yLyrVUBdtKebdazMfTxzandkjF9liOc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=KOOzSYZPzTRA5aPp2KHfrFPzCVsOfPXRe/j9cqtBzroq/M6fRd/P05zPhRNi/CwdVQqAqVyAXKoL3IuCr0GFQ4oWwm6TpUAOvQdDOtkikW1BhXAICCLrterQ0bPct4mneh2asfqvDjXyxPKWKRAZV3bdVZ6e0nfsncpdyuqhD5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-518954032b2so1748904e0c.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 21 Jan 2025 02:47:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737456429; x=1738061229;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EOt2TgFppnsnxLd3UE6C9YfpxR9Om80R0SFKRWm8pBw=;
        b=Fa2Z0GAGJkjLUOutujsbQm9Nw3VNEkqEAWVwd5mc2QFOlBfrpn22AjqqP/1GOQ+lGO
         N8tp4O9o0HGLxReRGAbDReC3cWDC5mgOZpabk7bKRqSWNwrngToT9FXe2osHR05YQsKh
         xVRAIv5r/9hcJGG2hc39dJeM1K+yQVYt6XdRrhD52IatIUeZu9G2GLTh3ME4EMyLV1a3
         Cz1h2atLmmqoMJNKUJiyGj9fw9vyzec1/NN8DWOnuHkdejk9RcJNtoEbIp+lzi6usYEx
         ALbIWdwm2u74oToONYhWxORGObJ72YETyn4O1TL9y2wAsX021pzSpYSYjR1COnKh9zWJ
         4CCA==
X-Forwarded-Encrypted: i=1; AJvYcCV/zCkIaF/qB8UIaPooCwun1/FBOlBZuKeqDK3USUQGJRiA5JmuNDlqeiqyGGTH3s/SG4Za0B9mOX4d@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yxyt2/R5rOzgiRygeLGa0lXcbGW+IzUHJHP3vq1hXM3YVwSgKem
	IKNbwvyyAZxf+olNoZ1BGo2RFBnZrQuPibPTk17r8A83hhLYhm29iWzfYL1C
X-Gm-Gg: ASbGnctObFUWQYR3ny5LqZLCaGeE08ivH6U237edEvLqBe0VjlMIGAlZ0yFJUcLg4vH
	Kq7EAYotKuC9wDeg6g3zTLbTFRKs5Tz42BnUVn3Q7RaneknwDntJqt+ENR9s97iFQTSi9BksHZk
	6SzvPeUi8aUhjiKrRo3dV8XORrNgP/T/VWVymZOF1zJC/HBKYdh9pleH8PzcbMed/5lU8C5E91r
	pkHgSNjME3GhHhtkpGl6bfgb4pQOE4Wx2olM6rdg9SJlhgczbwgrhOZ44k6zit/sX+PmEL8aTDY
	Fw7p3SsjwCiEZrTqmewKbrLuERgmaRxKrj5B
X-Google-Smtp-Source: AGHT+IHuFAKFPgi/O7KW5XiTNOhs7o2OTBlyZ3VYdOEXswgt3fmCW9FVMnxYgX7tuTRT2Tjotu1ChQ==
X-Received: by 2002:a05:6122:d88:b0:515:4b68:c37f with SMTP id 71dfb90a1353d-51d5b2e7e9amr11717760e0c.6.1737456428978;
        Tue, 21 Jan 2025 02:47:08 -0800 (PST)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51cf557759fsm1715266e0c.2.2025.01.21.02.47.08
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 02:47:08 -0800 (PST)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-518954032b2so1748898e0c.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 21 Jan 2025 02:47:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUed6/y8H69qK5TI8y/ZEuEEWJc7eqC93d25H25r1CuLVsvYJyVUQZh7X2nAfnmUeh8b1QmgndfUUCY@lists.linux-m68k.org
X-Received: by 2002:a05:6122:6581:b0:517:4fb0:749c with SMTP id
 71dfb90a1353d-51d592ba751mr12112958e0c.3.1737456428466; Tue, 21 Jan 2025
 02:47:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Jan 2025 11:46:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVurFmEkjGE4h7nzHLorNaRwkW=UfVEBsDR58D535FQig@mail.gmail.com>
X-Gm-Features: AbW1kvYqO4h_4QvUFNJQ3hsroP72whsBW3sqoNUPrIoZBxlO0jY1AZuLNj_mU20
Message-ID: <CAMuHMdVurFmEkjGE4h7nzHLorNaRwkW=UfVEBsDR58D535FQig@mail.gmail.com>
Subject: ARAnyM pauses until pressing pause
To: Petr Stehlik <pstehlik@sophics.cz>
Cc: aranym@googlegroups.com, linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"

Hi all,

Recently (after upgrading to Ubuntu 24.04LTS?) ARAnyM started hanging
when booting Linux on a Debian nfsroot.

When I press "Pause" to bring up the ARAnyM config screen, the system
continues booting.  If I was pinging the target, suddenly all replies
lost before arrive.  Pressing "Pause" again to make the config screen
disappear may suspend network operation again, or it may keep on
working.  Until after a while I have to press "Pause" again to kick
it...

I did manage to do an apt-upgrade while pinging the VM, and no packet
was lost.  Perhaps it's just the systemd startup scripts that trigger
the issue? ;-)

Apparently I can reproduce the issue with my old Debian on a disk image,
too.  The issue is just less likely to happen when relying less on the
network.

Perhaps this is the same issue as Mark reported in [1]?

I am using ARAnyM 1.1.0-2 from Ubuntu 24.04LTS.

[1] https://groups.google.com/g/aranym/c/8RpvCY49dF8

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
