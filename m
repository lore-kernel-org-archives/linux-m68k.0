From: kbuild test robot <fengguang.wu@intel.com>
Subject: [m68k:m68k-queue 26/41] drivers/staging/telephony/ixj.c:7502:2:
 warning: cast to pointer from integer of different size
Date: Tue, 30 Oct 2012 06:13:40 +0800
Message-ID: <508eff94.AAxnfkXjIX+vFsG/%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@opal.biophys.uni-duesseldorf.de>
Cc: linux-m68k@lists.linux-m68k.org, Roman Zippel <zippel@linux-m68k.org>, Geert Uytterhoeven <geert@linux-m68k.org>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git m68k-queue
head:   f8b528c5119edf08ac32fa0b14b651a54d6e9710
commit: affb0274d413e6f35e9fb4b36e8aa5fa5b13105c [26/41] m68k/atari: Initial ROM port ISA adapter support
config: make ARCH=m68k allmodconfig

All warnings:

drivers/staging/telephony/ixj.c: In function 'PCIEE_WriteBit':
drivers/staging/telephony/ixj.c:7502:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/staging/telephony/ixj.c:7506:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/staging/telephony/ixj.c:7511:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/staging/telephony/ixj.c: In function 'PCIEE_ReadBit':
drivers/staging/telephony/ixj.c:7519:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/staging/telephony/ixj.c:7523:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/staging/telephony/ixj.c:7525:11: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/staging/telephony/ixj.c: In function 'PCIEE_ReadWord':
drivers/staging/telephony/ixj.c:7535:12: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/staging/telephony/ixj.c:7538:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/staging/telephony/ixj.c:7558:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
--
drivers/block/hd.c: In function 'hd_out':
drivers/block/hd.c:327:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/block/hd.c:328:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/block/hd.c:329:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/block/hd.c:330:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/block/hd.c:331:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/block/hd.c:332:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/block/hd.c:333:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
--
drivers/scsi/ppa.c: In function 'ppa_byte_out':
drivers/scsi/ppa.c:261:3: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/scsi/ppa.c: In function 'ppa_byte_in':
drivers/scsi/ppa.c:273:15: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/scsi/ppa.c: In function 'ppa_d_pulse':
drivers/scsi/ppa.c:395:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/scsi/ppa.c: In function 'ppa_c_pulse':
drivers/scsi/ppa.c:415:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/scsi/ppa.c: In function 'ppa_select':
drivers/scsi/ppa.c:452:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/scsi/ppa.c:455:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
--
drivers/scsi/imm.c: In function 'imm_negotiate':
drivers/scsi/imm.c:264:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/scsi/imm.c: In function 'imm_byte_out':
drivers/scsi/imm.c:320:3: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/scsi/imm.c:322:3: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/scsi/imm.c: In function 'imm_byte_in':
drivers/scsi/imm.c:358:15: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/scsi/imm.c: In function 'imm_cpp':
drivers/scsi/imm.c:478:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/scsi/imm.c:480:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/scsi/imm.c:482:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/scsi/imm.c:484:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/scsi/imm.c:487:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/scsi/imm.c:490:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/scsi/imm.c:503:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/scsi/imm.c:511:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/scsi/imm.c: In function 'imm_select':
drivers/scsi/imm.c:580:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
--
drivers/misc/altera-stapl/altera-lpt.c: In function 'byteblaster_write':
drivers/misc/altera-stapl/altera-lpt.c:34:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/misc/altera-stapl/altera-lpt.c: In function 'byteblaster_read':
drivers/misc/altera-stapl/altera-lpt.c:40:9: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
--
drivers/media/rc/nuvoton-cir.c: In function 'nvt_cr_write':
drivers/media/rc/nuvoton-cir.c:45:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/media/rc/nuvoton-cir.c:46:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/media/rc/nuvoton-cir.c: In function 'nvt_cr_read':
drivers/media/rc/nuvoton-cir.c:52:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/media/rc/nuvoton-cir.c:53:9: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/media/rc/nuvoton-cir.c: In function 'nvt_efm_enable':
drivers/media/rc/nuvoton-cir.c:74:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/media/rc/nuvoton-cir.c:75:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/media/rc/nuvoton-cir.c: In function 'nvt_efm_disable':
drivers/media/rc/nuvoton-cir.c:81:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/media/rc/nuvoton-cir.c: In function 'nvt_select_logical_dev':
drivers/media/rc/nuvoton-cir.c:91:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/media/rc/nuvoton-cir.c:92:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
--
drivers/media/rc/fintek-cir.c: In function 'fintek_cr_write':
drivers/media/rc/fintek-cir.c:45:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/media/rc/fintek-cir.c:46:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/media/rc/fintek-cir.c: In function 'fintek_cr_read':
drivers/media/rc/fintek-cir.c:54:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/media/rc/fintek-cir.c:55:8: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/media/rc/fintek-cir.c: In function 'fintek_config_mode_enable':
drivers/media/rc/fintek-cir.c:80:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/media/rc/fintek-cir.c:81:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/media/rc/fintek-cir.c: In function 'fintek_config_mode_disable':
drivers/media/rc/fintek-cir.c:87:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
--
drivers/isdn/icn/icn.c: In function 'icn_shiftout':
drivers/isdn/icn/icn.c:89:3: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/isdn/icn/icn.c: In function 'icn_sendbuf':
drivers/isdn/icn/icn.c:721:2: warning: #warning TODO test headroom or use skb->nb to flag ACK [-Wcpp]
--
drivers/hwmon/smsc47b397.c: In function 'smsc47b397_read_value':
drivers/hwmon/smsc47b397.c:121:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
--
drivers/hwmon/sch56xx-common.c: In function 'sch56xx_send_cmd':
drivers/hwmon/sch56xx-common.c:148:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
--
In file included from drivers/tty/rocket.c:94:0:
drivers/tty/rocket_int.h: In function 'sOutB':
drivers/tty/rocket_int.h:45:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/tty/rocket_int.h: In function 'sOutW':
drivers/tty/rocket_int.h:53:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/tty/rocket_int.h: In function 'out32':
drivers/tty/rocket_int.h:62:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/tty/rocket_int.h: In function 'sInB':
drivers/tty/rocket_int.h:67:9: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/tty/rocket_int.h: In function 'sInW':
drivers/tty/rocket_int.h:72:9: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/tty/rocket_int.h:72:9: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/tty/rocket_int.h:72:9: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/tty/rocket_int.h:72:9: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/tty/rocket.c: At top level:
drivers/tty/rocket.c:3118:13: warning: 'rmSpeakerReset' defined but not used [-Wunused-function]
drivers/tty/rocket.c:2577:12: warning: 'sPCIInitController' defined but not used [-Wunused-function]

vim +7502 drivers/staging/telephony/ixj.c

^1da177e drivers/telephony/ixj.c Linus Torvalds 2005-04-16  7496  } DATABLOCK;
^1da177e drivers/telephony/ixj.c Linus Torvalds 2005-04-16  7497  
^1da177e drivers/telephony/ixj.c Linus Torvalds 2005-04-16  7498  static void PCIEE_WriteBit(WORD wEEPROMAddress, BYTE lastLCC, BYTE byData)
^1da177e drivers/telephony/ixj.c Linus Torvalds 2005-04-16  7499  {
^1da177e drivers/telephony/ixj.c Linus Torvalds 2005-04-16  7500  	lastLCC = lastLCC & 0xfb;
^1da177e drivers/telephony/ixj.c Linus Torvalds 2005-04-16  7501  	lastLCC = lastLCC | (byData ? 4 : 0);
^1da177e drivers/telephony/ixj.c Linus Torvalds 2005-04-16 @7502  	outb(lastLCC, wEEPROMAddress);	/*set data out bit as appropriate */
^1da177e drivers/telephony/ixj.c Linus Torvalds 2005-04-16  7503  
^1da177e drivers/telephony/ixj.c Linus Torvalds 2005-04-16  7504  	mdelay(1);
^1da177e drivers/telephony/ixj.c Linus Torvalds 2005-04-16  7505  	lastLCC = lastLCC | 0x01;
^1da177e drivers/telephony/ixj.c Linus Torvalds 2005-04-16 @7506  	outb(lastLCC, wEEPROMAddress);	/*SK rising edge */
^1da177e drivers/telephony/ixj.c Linus Torvalds 2005-04-16  7507  
^1da177e drivers/telephony/ixj.c Linus Torvalds 2005-04-16  7508  	byData = byData << 1;
^1da177e drivers/telephony/ixj.c Linus Torvalds 2005-04-16  7509  	lastLCC = lastLCC & 0xfe;

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
