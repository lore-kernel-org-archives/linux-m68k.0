Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50BFB20B0E
	for <linux-m68k@vger.kernel.org>; Sun, 14 Apr 2024 23:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713136081; cv=none; b=Rva8r+X6IJ18Yb0jgqqrZ6LDjLpz1hmZi1KZDqm8zdES77kMDvFxXrGyD2kqQo9Z3DlUvUpLb4Ckz2hbHlC68fcjI6fesUj2xzdcYawcwU6iCWDr4b41Qy2ldvu/Psj3M6FwuaxI0B5FQINm5DLvlGKkodKJvc5IBQq/0Z4EG/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713136081; c=relaxed/simple;
	bh=VWiqXYKEyZm8E3G9pBqxm8fwi1evOxWpaLiitCl16DM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=HfCy8KL/nA1LHtm0kmfpjzY3JgjmnI8XHGKQmPPGSCGCUbwfvevT9XgqR+/N4CWwTt6sMmnKIfFTw+7lYbfVQHeuGEIer+faZc3ppDGT03Dp/omWrFIrVUwmkfm0TJuGPXJZk6lFmUlTM+8XvmLHJ5v56eQ8sFGGWdeECTXDcGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iIwW9cpm; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iIwW9cpm"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-4dac5a3fbeaso858345e0c.3
        for <linux-m68k@vger.kernel.org>; Sun, 14 Apr 2024 16:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713136079; x=1713740879; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=H7qu8aGjAq/DoIrOfQHP9JCTOIuFo6zZ7b8SG3b+9Vk=;
        b=iIwW9cpm0KNMxzNMABI6rf5vt74nwQ/YdBzLknZLxekeEvtt0vbaZelI+iU/m3uPXu
         Y/zS7F0k0qVm/td//cr/JwzbNAkpE+BmHSm6zXhiPFw3DKe2hrKONY1sFoNw79VYPfzK
         +rX+9kQeFDmWCMHQqnEORQptXS7IWchwLn97zDYSEcPl3RMgjKeXT/aFLQ+i4gliJogk
         WfIKJLs1JE5D+4hjS2hdBzTg9YpfLL6q6p6UJ7PdckONYUEBDADWuHC/fTaIlO5AZ4f7
         jLltOBSPymLV8MweIGt+2Us7HzJGwbQFUdmTQLMGC5UF+ntQ32GghfFxI3Nuqwdv4gwc
         3nbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713136079; x=1713740879;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H7qu8aGjAq/DoIrOfQHP9JCTOIuFo6zZ7b8SG3b+9Vk=;
        b=CAaPUfenVlW3Awy8EICjH0auN/u/nB7iLnpSIWKihwLORejQN0TBfzbrZXOpU6PdrF
         PB+/T/V3DH6ITCDxFpNKm5s7zS7OjynITRY6UgTG4gYdJRCpzxFVosCg4pvY6WouqiVV
         NuMgk5GBcJ0DYa5b/uppE3aLrpI9dkYKU506gVnJdWK42GPFEn+WRM5oRLZH/F5/krmj
         Qjt9mO/NHEq88zbvv1lLcAwikOFkKzEwL8Vi7dHGIjzejKZT0+yhYi1uGX+s/qeTKoru
         12C9s+ZLskvNwIVcMuzxLQVxZthofLWrOFYYLd/Xayh/eAELnwLlLk2fosvBfVIEBKyT
         r/qQ==
X-Gm-Message-State: AOJu0YxfT06wsz1a0fjxLiyemes96y3KulHm+PF3xG0XDYbrO5YbAjgZ
	mJbguQJ1fmHCMBNgO0ptMzCOSH4wusZPBMzbhIOBq1/q+gWcf4nE/CfuyYNoAEW6gso0xtLAV1u
	CS9DPp7KaacaRMAYqrGDXmarW/Yn1xFENfe0=
X-Google-Smtp-Source: AGHT+IE4Uc6VX7SZAPnho4S1lWO690YNI+V+yKm/LxyVtb47qcQMJTEBOdv7/wcn0wqtrkCmeyK10WsbI1114ak7AWo=
X-Received: by 2002:a05:6102:304a:b0:47a:456b:6336 with SMTP id
 w10-20020a056102304a00b0047a456b6336mr5855499vsa.14.1713136079036; Sun, 14
 Apr 2024 16:07:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: The Mariocrafter <kayvonkamyar@gmail.com>
Date: Sun, 14 Apr 2024 16:07:47 -0700
Message-ID: <CAEgzAWxZOMZYSzsiJJxOAy5otCGBvOZe9STGdjkkzWZa5p3dvg@mail.gmail.com>
Subject: MFS Filesystem support
To: linux-m68k@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Macintosh File System (MFS) is a filesystem used in early Macintosh
models up to those running System 3, when the original HFS (which is
supported within Linux) supported it.  Although no Mac model that
shipped or can run with an MFS-only macOS can run Linux, floppy disks
formatted with an MFS system may still exist and the user never
bothered to reformat it to HFS or HFS+, and the main use case I can
think of is using MFS to transfer files from a modern device to a Mac
that does not support HFS. It would be nice supporting the MFS
filesystem natively within Linux, which could be read-only or
read-write.

MFS is a very limited filesystem, meaning it's simple to implement,
albeit being less efficient than its successors. MFS stored files in a
single flat structure without subdirectories; the illusion of
"folders" was created by including a "directory handle" in each file
entry so that the single directory could be scanned to find files that
belong to a particular virtual folder. File names could be up to 255
characters, though Finder didn't support more than 63 or 31 characters
(depending on the version). Resource Forks were introduced in MFS. An
MFS volume consists of a boot block, a master directory block, some
file directory blocks, and some allocation blocks. It may also have a
backup master directory block, but this is optional. These blocks are
each defined in terms of 512-byte sectors. Unless otherwise specified,
all values are big-endian (MSB first). Information about the
filesystem is relatively easy to find.
