Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FE41DC988
	for <linux-m68k@lists.linux-m68k.org>; Mon,  6 Jan 2025 10:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736161158; cv=none; b=Yo1RixWUPqKoNzD9SETtQ020A1cStY2O1FSKI9K1mzNl9TGGvZgMvzDU3dD/EIk9VlfMdzWb5/ltRJTyQwRWVrGjZ+JRWw8v+8+wQpkwCid325q4RnHYyeO1R9BlkgvmeXTN8rkVnspP8lMzIGi20vlk481aNsvPC+nwCD1PxW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736161158; c=relaxed/simple;
	bh=ErVrTjQTnrcJ4QgCkFLOVLncHkcN82/+t7EHdJX6nj8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TXi1sqLVPDblOXXTwo5MPI6slfZ3vqCne9HnPu4NxAES6zpmeouSzD9j/Y8dj8KuAAGCIpxosjWGEygVCyggzOQh3FMvbF8dVQARqbSdP0bFFiDxd2ZXxcuRzD4vtKXsPkar9ukYjrRCpxoaBIG4tgrUlQjmfBV8fzOQgJ0Mz0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mwq/epXA; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mwq/epXA"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4361c705434so102687705e9.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 06 Jan 2025 02:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736161155; x=1736765955; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rGHpVK1pgwjXUnuBrtM7o2RIlNaOXIumSPhdbcQwh8w=;
        b=mwq/epXAU8sjeyW2tXnZZnxKxAV54PTn9THqBpAcfqdQr/P/q3galCanaLNWyzur+0
         dExeI4AQ9fBzSBjlWT/9NEg2X+FcjWdJY81LrY+R4Fd9BwB0fX+YivMPy5rchQ0ezFSy
         7IlLWpvBIL9jm1yoJGZ+TGi/Q1dIDMcpNNlrL32GRUjwvERmeC2WUUUFFmislQOf8sq+
         8BeA3XcXB9CibdsxhHrYZa3K3cJ+lyaT6/9IiUfNrIShAMVnVjniGVVkWfE0+r9KN3tP
         E5Wn8knDkoJf0MLrye2fUyPwEwD24LnynCPL8KPgtGO74uN8pLqM7qAv6IkNRb6uXSin
         F9lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736161155; x=1736765955;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rGHpVK1pgwjXUnuBrtM7o2RIlNaOXIumSPhdbcQwh8w=;
        b=nPwTnazFYhoWRXH6WWxlbhxHLISX7NhmqFDMCE4gcGyMRg1eKtqL3oDypYT/1V867l
         FogS3adEDcQQUr1ls+wz5aJ5opCxhn1oU4SvJaERbkrW8i25HuyafdL9/s1k78rpGNUP
         hU7zK6T6dk0Ki077zKwIuDZLDD2HWPSXlWPPn/6J8zuTqVh8Stmki0XZLc6han4E0TKE
         mR7rMklwdlBEG6UCPJTOHrm6t7Z6upRtvHo6S2KdwnJGpkZQD+4Cnq95vmeiuJeZRe5+
         cDUWol4PI399hKUZ3MSNEzxxQVb2rXVy5Rk3KKBdIxbbZj9bquRShZGb6FHQkWzOmq0C
         w1mQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGbhS9cbHxuuBX7LIIGS34dLvKCQeOP2VO3oDIrcu8ILl9OUDJzZsLYsv2hjhbr3xJNk1/6nvVZdka@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yz/y+XjDTyos9I5HyAF6T2gx+2JhYtcEBtLpZ0Hu0adYURoO78K
	/fjKkw3iLIAOO7jnYumRQOpA4xdJM0dZVblbhZb1ErePq5zEo9rqobVhwZT86ec=
X-Gm-Gg: ASbGncsxAO4s4ZF5C8kTQy2JGbSquaQBKF8m1lgzwabgVRPIuIJcyFtl5lI7McR2eiE
	tL2lzauQTQgUTqwmKtO4YhUTttGpUCLP2fx9H6Pozr58USYxWZ3gMH6fqDxOGbDY3+ajS7+kwCQ
	FM+50hGsFacH/Vj2y9Iffmb1VH9cQu7aMU9PSdFXlLFxuMEnXlGmo3/g5VKuqad9pRp9MtBbqBR
	mCpCu+j71HqgdzVxc/UWbqekmBMUVanxNJC8BcndRqjExZiyLZzLO/VfieaEg==
X-Google-Smtp-Source: AGHT+IHjGCBAHYcrmzbtuFGrX2DIGSLhoBn+LUgUMGhredPFuHNSJWEpV6FO9CkvBHijZu0wjs3jTw==
X-Received: by 2002:a05:6000:2ad:b0:385:e8f9:e839 with SMTP id ffacd0b85a97d-38a224063b2mr43747658f8f.56.1736161155021;
        Mon, 06 Jan 2025 02:59:15 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436604e9c2csm565202195e9.43.2025.01.06.02.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 02:59:14 -0800 (PST)
Date: Mon, 6 Jan 2025 13:59:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Greg Ungerer <gerg@uclinux.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org, uclinux-dev@uclinux.org
Subject: [gerg-m68knommu:armnommu 3/3] drivers/mtd/maps/pismo.c:243
 pismo_probe() error: we previously assumed 'pdata' could be null (see line
 226)
Message-ID: <c25c37d3-eb4c-42de-b961-7eca78ab6a8d@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git armnommu
head:   d03e292d5f72c15f004a13503f4a5cca0a26bec0
commit: d03e292d5f72c15f004a13503f4a5cca0a26bec0 [3/3] ARM: versatile: support configuring versatile machine for no-MMU
config: arm-randconfig-r073-20241230 (https://download.01.org/0day-ci/archive/20241231/202412310053.VgXsTpPO-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412310053.VgXsTpPO-lkp@intel.com/

smatch warnings:
drivers/mtd/maps/pismo.c:243 pismo_probe() error: we previously assumed 'pdata' could be null (see line 226)

vim +/pdata +243 drivers/mtd/maps/pismo.c

0b79d5d1e5982b Uwe Kleine-König         2023-02-26  209  static int pismo_probe(struct i2c_client *client)
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  210  {
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  211  	struct pismo_pdata *pdata = client->dev.platform_data;
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  212  	struct pismo_eeprom eeprom;
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  213  	struct pismo_data *pismo;
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  214  	int ret, i;
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  215  
752031210ca145 Wolfram Sang             2019-07-22  216  	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  217  		dev_err(&client->dev, "functionality mismatch\n");
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  218  		return -EIO;
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  219  	}
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  220  
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  221  	pismo = kzalloc(sizeof(*pismo), GFP_KERNEL);
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  222  	if (!pismo)
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  223  		return -ENOMEM;
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  224  
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  225  	pismo->client = client;
f6a8c60960bbea Russell King - ARM Linux 2009-11-29 @226  	if (pdata) {
                                                                    ^^^^^
This code assumes pdata can be NULL

f6a8c60960bbea Russell King - ARM Linux 2009-11-29  227  		pismo->vpp = pdata->set_vpp;
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  228  		pismo->vpp_data = pdata->vpp_data;
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  229  	}
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  230  	i2c_set_clientdata(client, pismo);
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  231  
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  232  	ret = pismo_eeprom_read(client, &eeprom, 0, sizeof(eeprom));
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  233  	if (ret < 0) {
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  234  		dev_err(&client->dev, "error reading EEPROM: %d\n", ret);
395b228858778d Wolfram Sang             2010-03-20  235  		goto exit_free;
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  236  	}
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  237  
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  238  	dev_info(&client->dev, "%.15s board found\n", eeprom.board);
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  239  
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  240  	for (i = 0; i < ARRAY_SIZE(eeprom.cs); i++)
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  241  		if (eeprom.cs[i].type != 0xff)
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  242  			pismo_add_one(pismo, i, &eeprom.cs[i],
f6a8c60960bbea Russell King - ARM Linux 2009-11-29 @243  				      pdata->cs_addrs[i]);
                                                                                              ^^^^^^^
Unchecked dereference

f6a8c60960bbea Russell King - ARM Linux 2009-11-29  244  
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  245  	return 0;
395b228858778d Wolfram Sang             2010-03-20  246  
395b228858778d Wolfram Sang             2010-03-20  247   exit_free:
395b228858778d Wolfram Sang             2010-03-20  248  	kfree(pismo);
395b228858778d Wolfram Sang             2010-03-20  249  	return ret;
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  250  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

